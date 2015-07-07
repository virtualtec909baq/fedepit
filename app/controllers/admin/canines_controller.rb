class Admin::CaninesController < ApplicationController
  autocomplete :canine, :name, :extra_data => [:id], :full => true
  autocomplete :canine, :lof, :full => true
  before_action :authenticate_user!
  before_action :set_canine, only: [:show, :edit, :update, :destroy, :pedigree]
  before_action :init, only: [:create]
  before_action :ancestors, only: [:create, :update]

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
   respond_to do |format|
     format.html
     format.pdf do
        pdf = CaninePdf.new(@canine)
        send_data pdf.render, filename: "generate_table.pdf",
                              type: "application/pdf",
                              disposition: "inline"
     end
   end
end

  # GET /canines/new
  def new
    @canine = Canine.new
    @image = @canine.images.build
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
    
    # Use callbacks to share common setup or constraints between actions.
    def set_canine
      @canine = Canine.find(params[:id])
    end

    def init
      o = [('a'..'z'), ('1'..'9'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...5).map { o[rand(o.length)] }.join
      val = string+Time.now.strftime('%H%S%L')
      params[:canine][:lof] = val
    end

    def ancestors
      if Canine.exists?(params[:canine][:lft]) and !params[:canine][:lft]
        parent_id << params[:canine][:lft]
      end
      if Canine.exists?(params[:canine][:rgt]) and !params[:canine][:rgt]
        parent_id << params[:canine][:rgt]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canine_params
      params.require(:canine).permit(:parent_id,:kind, :lft, :rgt ,:race_id, :breeder_id, :lof, :chip, :name, :gender, :color_id, :father_lof, :mother_lof, :rate, :birth, :death,images_attributes: [:id, :canine_id, :file])
    end
end
