class Admin::CaninesController < ApplicationController
  include ApplicationHelper
  autocomplete :canine, :name, :extra_data => [:id]
  autocomplete :canine, :lof, :full => true
  before_action :authenticate_user!
  before_action :set_canine, only: [:show, :edit, :update, :destroy, :pedigree]
  before_action :init, only: [:create]
  before_action :set_lof, only: [:create]

  # GET /canines
  # GET /canines.json
  def index
    @canines = Canine.all
    @search = Canine.ransack(params[:q])
    @canines = @search.result.order(created_at: :desc).page(params[:page])
    @canine = Canine.new
    respond_to do |format|
      format.html
      format.js
    end    
  end

  # GET /canines/1
  # GET /canines/1.json
  def show
    @images = @canine.images
    @canine_awards = @canine.events
    @feature = @canine.feature
  end

  # GET /canines/new
  def new
    @canine = Canine.new
    @image = @canine.images.build
  end

  def enviar_cruce
    @canine_1 = Canine.find(params[:merge][:canine_id])
    @canine_2 = Canine.find(params[:merge][:canine_id_2])
    respond_to do |format|
      if has_children(@canine_1.id) and has_children(@canine_1.id)
        @children_canine_1 = children(@canine_1.id)
        @children_canine_2 = children(@canine_2.id)
        if  !@children_canine_1.empty? and !@children_canine_2.empty?
            bite_prognato(@children_canine_1, @children_canine_2)
        end
        
        format.html { redirect_to admin_realizarcruce_path(:status => true, :canine_1_prognato_true => @@canine_1_prognato_true, :canine_1_prognato_false => @@canine_1_prognato_false, :canine_2_prognato_true => @@canine_2_prognato_true, :canine_2_prognato_false => @@canine_2_prognato_false), notice: 'Se Creado un Metter'}
      else
        format.html { redirect_to admin_realizarcruce_path() , notice: 'no se puede crear metter'}
      end
    end
  end

  # GET /canines/1/edit
  def edit
  end

  # POST /canines
  def awards
    @canine_event = CanineEvent.create(canine_id: params[:awards][:canine_id], event_id: params[:awards][:event_id], position: params[:awards][:position], reward: params[:awards][:reward])
    respond_to do |format|
      if @canine_event.save
        format.html { redirect_to admin_canine_path(@canine_event.canine_id), notice: 'Se ha agregado exitosamente tu premio.' }
        format.json { render :show, status: :created, location: @canine_event }
      else
        format.html { render :new }
        format.json { render json: @canine_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /canines
  # POST /canines.json

  def create
   @canine = Canine.new(canine_params)
   respond_to do |format|
     if @canine.save
      if !params[:images].blank?
         params[:images]['file'].each do |a|
            @image = @canine.images.create!(:file => a, :canine_id => @canine.id)
         end
      end
        format.html { redirect_to admin_canines_path, notice: 'Canine was successfully created.' }
        format.json { render :show, status: :created, location: @canine }
      else
        format.html { render :new }
        format.json { render json: @canine.errors, status: :unprocessable_entity }
     end
   end
 end

  # PATCH/PUT /canines/1
  # PATCH/PUT /canines/1.json

  def update
    respond_to do |format|
      if @canine.update(canine_params)
        format.html { redirect_to admin_canines_path, notice: 'canine was successfully updated.' }
        format.json { render :show, status: :ok, location: @canine }
      else
        format.html { render :edit }
        format.json { render json: @canine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canines/1
  # DELETE /canines/1.json

    def destroy
    @canine.destroy
    respond_to do |format|
      flash[:notice] = 'Ejemplar eliminado'
      format.html { redirect_to admin_canines_path}
      format.json { head :no_content }
    end
  end

  private
    
    def bite_prognato(children_canine_1, children_canine_2)
        @children_canine_1 = children_canine_1
        @children_canine_2 = children_canine_2
        
        @canino_1_bite_prognato_false = @children_canine_1.joins(:feature).where(features: {bite_prognato: false}).count
        @canino_1_bite_prognato_true = @children_canine_1.joins(:feature).where(features: {bite_prognato: true}).count
        
        @@canine_1_prognato_true = (@canino_1_bite_prognato_false/@total_children_canine_1) * 100
        @@canine_1_prognato_false = (@canino_1_bite_prognato_true/@total_children_canine_1) * 100
        
        @canino_2_bite_prognato_false = @children_canine_2.joins(:feature).where(features: {bite_prognato: false}).count
        @canino_2_bite_prognato_true = @children_canine_2.joins(:feature).where(features: {bite_prognato: true}).count
        
        @@canine_2_prognato_true = (@canino_2_bite_prognato_false/@total_children_canine_2) * 100
        @@canine_2_prognato_false = (@canino_2_bite_prognato_true/@total_children_canine_2) * 100
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_canine
      @canine = Canine.find(params[:id])
    end

    def set_lof
      if Canine.exists?(lof: params[:canine][:father_lof] )
        params[:canine][:lft] = Canine.find_by_lof(params[:canine][:father_lof]).id
      end
      if Canine.exists?(lof: params[:canine][:mother_lof])
        params[:canine][:rgt] = Canine.find_by_lof(params[:canine][:mother_lof]).id
      end
    end

    def init
      o = [('a'..'z'), ('1'..'9'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...5).map { o[rand(o.length)] }.join
      val = string+Time.now.strftime('%H%S%L')
      params[:canine][:lof] = val
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canine_params
      params.require(:canine).permit(:lft, :rgt ,:race_id, :breeder_id, :lof, :chip, :name, :gender, :color_id, :father_lof, :mother_lof, :rate, :birth, :death,images_attributes: [:id, :canine_id, :file])
    end
end
