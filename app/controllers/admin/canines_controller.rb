class Admin::CaninesController < ApplicationController
  include ApplicationHelper
  autocomplete :canine, :name, :extra_data => [:id], :full => true
  autocomplete :canine, :lof, :full => true
  before_action :authenticate_user!
  before_action :set_canine, only: [:show, :edit, :update, :destroy, :pedigree, :endogamia]
  before_action :init, only: [:create]
  before_action :ancestors, only: [:create, :update]
  
  # GET /canines
  # GET /canines.json
  def index
    @search = Canine.ransack(params[:q])
    @canines = @search.result.order(name: :asc).page(params[:page])
    @total_canines = Canine.count
    @canines_week = Canine.where(:created_at => (Time.now - 7.days)..(Time.now)).count
    @canines_day = Canine.where(:created_at => (Time.now.beginning_of_day)..(Time.now.end_of_day)).count
    @canines_kind_1 = Canine.where(:kind => "1").count
    @canines_kind_0 = Canine.where(:kind => "0").count
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
    @array_ancestor = get_ancestor_with_hash(@canine).count
    @ranking = 0
    @canine.champions.each do |category|
      @ranking = @ranking + category.points
    end
    @canino_characteristics = CaninoCharacteristic.where(canine_id: params[:id]).order(created_at: :asc)
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
  
  def pedigree
    # papa
    if @canine.lft
      canine_lft = Canine.find(@canine.lft)
      @canine_lftname = canine_lft.name
      @canine_lftpic = pic_canine(canine_lft)
      @canine_lftid= canine_lft.id
      # abuelos paternos
      if canine_lft.lft
        canine_lft_lft = Canine.find(canine_lft.lft)
        @canine_lft_lftname = canine_lft_lft.name
        @canine_lft_lftpic = pic_canine(canine_lft_lft)
        @canine_lft_lftid = canine_lft_lft.id
        if canine_lft_lft.lft
          canine_lft_lft_lft = Canine.find(canine_lft_lft.lft)
          @canine_lft_lft_lftname = canine_lft_lft_lft.name
          @canine_lft_lft_lftpic = pic_canine(canine_lft_lft_lft)
          @canine_lft_lft_lftid = canine_lft_lft_lft.id
          if canine_lft_lft_lft.lft
            canine_lft_lft_lft_lft = Canine.find(canine_lft_lft_lft.lft)
            @canine_lft_lft_lft_lftname = canine_lft_lft_lft_lft.name
            @canine_lft_lft_lft_lftid = canine_lft_lft_lft_lft.id
          else
            @canine_lft_lft_lft_lftname =  ""
            @canine_lft_lft_lft_lftid = ""
          end
          if canine_lft_lft_lft.rgt
            canine_lft_lft_lft_rgt = Canine.find(canine_lft_lft_lft.rgt)
            @canine_lft_lft_lft_rgtname = canine_lft_lft_lft_rgt.name
            @canine_lft_lft_lft_rgtid = canine_lft_lft_lft_rgt.id
          else
            @canine_lft_lft_lft_rgtname =  ""
            @canine_lft_lft_lft_rgtid = ""
          end
        else
          @canine_lft_lft_lftname = ""
          @canine_lft_lft_lftpic = ""
          @canine_lft_lft_lftid = ""
        end

        if canine_lft_lft.rgt
          canine_lft_lft_rgt = Canine.find(canine_lft_lft.rgt)
          @canine_lft_lft_rgtname = canine_lft_lft_rgt.name
          @canine_lft_lft_rgtpic = pic_canine(canine_lft_lft_rgt)
          @canine_lft_lft_rgtid = canine_lft_lft_rgt.id
          if canine_lft_lft_rgt.lft
            canine_lft_lft_rgt_lft = Canine.find(canine_lft_lft_rgt.lft)
            @canine_lft_lft_rgt_lftname = canine_lft_lft_rgt_lft.name
            @canine_lft_lft_rgt_lftid = canine_lft_lft_rgt_lft.id
          else
            @canine_lft_lft_rgt_lftname = ""
            @canine_lft_lft_rgt_lftid = ""
          end
          if canine_lft_lft_rgt.rgt
            canine_lft_lft_rgt_rgt = Canine.find(canine_lft_lft_rgt.rgt)
            @canine_lft_lft_rgt_rgtname = canine_lft_lft_rgt_rgt.name
            @canine_lft_lft_rgt_rgtid = canine_lft_lft_rgt_rgt.id
          else
            @canine_lft_lft_rgt_lftname = ""
            @canine_lft_lft_rgt_lftid = ""
          end
        else
          @canine_lft_lft_rgtname = ""
          @canine_lft_lft_rgtpic = ""
          @canine_lft_lft_rgtid = ""
        end

      else
        @canine_lft_lftname = ""
        @canine_lft_lftpic = ""
        @canine_lft_lftid = ""
      end
      
      if canine_lft.rgt
        canine_lft_rgt = Canine.find(canine_lft.rgt)
        @canine_lft_rgtname = canine_lft_rgt.name
        @canine_lft_rgtpic = pic_canine(canine_lft_rgt)
        @canine_lft_rgtid = canine_lft_rgt.id
        
        if canine_lft_rgt.lft
          canine_lft_rgt_lft = Canine.find(canine_lft_rgt.lft)
          @canine_lft_rgt_lftname = canine_lft_rgt_lft.name
          @canine_lft_rgt_lftpic = pic_canine(canine_lft_rgt_lft)
          @canine_lft_rgt_lftid = canine_lft_rgt_lft.id
          if canine_lft_rgt_lft.lft
            canine_lft_rgt_lft_lft = Canine.find(canine_lft_rgt_lft.lft)
            @canine_lft_rgt_lft_lftname = canine_lft_rgt_lft_lft.name
            @canine_lft_rgt_lft_lftid = canine_lft_rgt_lft_lft.id
          else
            @canine_lft_rgt_lft_lftname = ""
            @canine_lft_rgt_lft_lftid = ""
          end
          if canine_lft_rgt_lft.rgt
            canine_lft_rgt_lft_rgt = Canine.find(canine_lft_rgt_lft.rgt)
            @canine_lft_rgt_lft_rgtname = canine_lft_rgt_lft_rgt.name
            @canine_lft_rgt_lft_rgtid = canine_lft_rgt_lft_rgt.id
          else
            @canine_lft_rgt_lft_rgtname = ""
            @canine_lft_rgt_lft_rgtid = ""
          end
        else
          @canine_lft_rgt_lftname = ""
          @canine_lft_rgt_lftpic =  ""
          @canine_lft_rgt_lftid = ""
        end

        if canine_lft_rgt.rgt
          canine_lft_rgt_rgt = Canine.find(canine_lft_rgt.rgt)
          @canine_lft_rgt_rgtname = canine_lft_rgt_rgt.name
          @canine_lft_rgt_rgtpic = pic_canine(canine_lft_rgt_rgt)
          @canine_lft_rgt_rgtid = canine_lft_rgt_rgt.id
          if canine_lft_rgt_rgt.lft
            canine_lft_rgt_rgt_lft = Canine.find(canine_lft_rgt_rgt.lft)
            @canine_lft_rgt_rgt_lftname = canine_lft_rgt_rgt_lft.name
            @canine_lft_rgt_rgt_lftid = canine_lft_rgt_rgt_lft.id
          else
            @canine_lft_rgt_rgt_lftname = ""
            @canine_lft_rgt_rgt_lftid = ""
          end
          if canine_lft_rgt_rgt.rgt
            canine_lft_rgt_rgt_rgt = Canine.find(canine_lft_rgt_rgt.rgt)
            @canine_lft_rgt_rgt_rgtname = canine_lft_rgt_rgt_rgt.name
            @canine_lft_rgt_rgt_rgtid = canine_lft_rgt_rgt_rgt.id
          else
            @canine_lft_rgt_rgt_rgtname = ""
            @canine_lft_rgt_rgt_rgtid = ""
          end
        else
          @canine_lft_rgt_rgtname = ""
          @canine_lft_rgt_rgtpic =  ""
          @canine_lft_rgt_rgtid = ""
        end

      else
        @canine_lft_rgtname = ""
        @canine_lft_rgtpic = ""
        @canine_lft_rgtid = ""
      end

    else
      @canine_lftname = ""
      @canine_lftpic = ""
      @canine_lftid= ""
    end
    
    # mama

    if @canine.rgt
      canine_rgt = Canine.find(@canine.rgt)
      @canine_rgtname = canine_rgt.name
      @canine_rgtpic = pic_canine(canine_rgt)
      @canine_rgtid = canine_rgt.id

      if canine_rgt.lft
        canine_rgt_lft = Canine.find(canine_rgt.lft)
        @canine_rgt_lftname = canine_rgt_lft.name
        @canine_rgt_lftpic = pic_canine(canine_rgt_lft)
        @canine_rgt_lftid = canine_rgt_lft.id
        if canine_rgt_lft.lft
          canine_rgt_lft_lft = Canine.find(canine_rgt_lft.lft)
          @canine_rgt_lft_lftname = canine_rgt_lft_lft.name
          @canine_rgt_lft_lftpic = pic_canine(canine_rgt_lft_lft)
          @canine_rgt_lft_lftid = canine_rgt_lft_lft.id
          if canine_rgt_lft_lft.lft
            canine_rgt_lft_lft_lft = Canine.find(canine_rgt_lft_lft.lft)
            @canine_rgt_lft_lft_lftname = canine_rgt_lft_lft_lft.name
            @canine_rgt_lft_lft_lftpic = pic_canine(canine_rgt_lft_lft_lft)
            @canine_rgt_lft_lft_lftid = canine_rgt_lft_lft_lft.id

            if canine_rgt_lft_lft_lft.lft
                canine_rgt_lft_lft_lft_lft = Canine.find(canine_rgt_lft_lft_lft.lft)
                @canine_rgt_lft_lft_lft_lftname = canine_rgt_lft_lft_lft_lft.name
                @canine_rgt_lft_lft_lft_lftid = canine_rgt_lft_lft_lft_lft.id
            else
                @canine_rgt_lft_lft_lft_lftname = ""
                @canine_rgt_lft_lft_lft_lftid = ""
            end
            if canine_rgt_lft_lft_lft.rgt
                canine_rgt_lft_lft_lft_rgt = Canine.find(canine_rgt_lft_lft_lft.rgt)
                @canine_rgt_lft_lft_lft_rgtname = canine_rgt_lft_lft_lft_rgt.name
                @canine_rgt_lft_lft_lft_rgtid = canine_rgt_lft_lft_lft_rgt.id
            else
                @canine_rgt_lft_lft_lft_rgtname = ""
                @canine_rgt_lft_lft_lft_rgtid = ""
            end
          else
            @canine_rgt_lft_lft_lftname = ""
            @canine_rgt_lft_lft_lftpic = ""
            @canine_rgt_lft_lft_lftid = ""
          end
          if canine_rgt_lft_lft.rgt
            canine_rgt_lft_lft_rgt = Canine.find(canine_rgt_lft_lft.rgt)
            @canine_rgt_lft_lft_rgtname = canine_rgt_lft_lft_rgt.name
            @canine_rgt_lft_lft_rgtpic = pic_canine(canine_rgt_lft_lft_rgt)
            @canine_rgt_lft_lft_rgtid = canine_rgt_lft_lft_rgt.id
            if canine_rgt_lft_lft_rgt.lft
              canine_rgt_lft_lft_rgt_lft = Canine.find(canine_rgt_lft_lft_rgt.lft)
              @canine_rgt_lft_lft_rgt_lftname = canine_rgt_lft_lft_rgt_lft.name
              @canine_rgt_lft_lft_rgt_lftid = canine_rgt_lft_lft_rgt_lft.id
            else
              @canine_rgt_lft_lft_rgt_lftname = ""
              @canine_rgt_lft_lft_rgt_lftid = ""
            end
            if canine_rgt_lft_lft_rgt.rgt
              canine_rgt_lft_lft_rgt_rgt = Canine.find(canine_rgt_lft_lft_rgt.rgt)
              @canine_rgt_lft_lft_rgt_rgtname = canine_rgt_lft_lft_rgt_rgt.name
              @canine_rgt_lft_lft_rgt_rgtid = canine_rgt_lft_lft_rgt_rgt.id
            else
              @canine_rgt_lft_lft_rgt_rgtname = ""
              @canine_rgt_lft_lft_rgt_rgtid = ""
            end
          else
            @canine_rgt_lft_lft_lftname = ""
            @canine_rgt_lft_lft_lftpic = ""
            @canine_rgt_lft_lft_lftid = ""
          end

        else
          @canine_rgt_lft_lftname = ""
          @canine_rgt_lft_lftpic = ""
          @canine_rgt_lft_lftid = ""
        end
      else
        @canine_rgt_lftname = ""
        @canine_rgt_lftpic = ""
        @canine_rgt_lftid =""
      end

      if canine_rgt.rgt
        canine_rgt_rgt = Canine.find(canine_rgt.rgt)
        @canine_rgt_rgtname = canine_rgt_rgt.name
        @canine_rgt_rgtpic = pic_canine(canine_rgt_rgt)
        @canine_rgt_rgtid = canine_rgt_rgt.id
        if canine_rgt_rgt.lft
          canine_rgt_rgt_lft = Canine.find(canine_rgt_rgt.lft)
          @canine_rgt_rgt_lftname = canine_rgt_rgt_lft.name
          @canine_rgt_rgt_lftpic = pic_canine(canine_rgt_rgt_lft)
          @canine_rgt_rgt_lftid = canine_rgt_rgt_lft.id
          if canine_rgt_rgt_lft.lft
            canine_rgt_rgt_lft_lft = Canine.find(canine_rgt_rgt_lft.lft)
            @canine_rgt_rgt_lft_lftname = canine_rgt_rgt_lft_lft.name
          else
            @canine_rgt_rgt_lft_lftname = ""
          end
          if canine_rgt_rgt_lft.rgt
            canine_rgt_rgt_lft_rgt = Canine.find(canine_rgt_rgt_lft.rgt)
            @canine_rgt_rgt_lft_rgtname = canine_rgt_rgt_lft_rgt.name
          else
            @canine_rgt_rgt_lft_rgtname = ""
          end
        else
          @canine_rgt_rgt_lftname = ""
          @canine_rgt_rgt_lftpic = ""
          @canine_rgt_rgt_lftid = ""
        end
        if canine_rgt_rgt.rgt
          canine_rgt_rgt_rgt = Canine.find(canine_rgt_rgt.rgt)
          @canine_rgt_rgt_rgtname = canine_rgt_rgt_rgt.name
          @canine_rgt_rgt_rgtpic = pic_canine(canine_rgt_rgt_rgt)
          @canine_rgt_rgt_rgtid = canine_rgt_rgt_rgt.id
          if canine_rgt_rgt_rgt.lft
            canine_rgt_rgt_rgt_lft = Canine.find(canine_rgt_rgt_rgt.lft)
            @canine_rgt_rgt_rgt_lftname = canine_rgt_rgt_rgt_lft.name
          else
            @canine_rgt_rgt_rgt_lftname = ""
          end
          if canine_rgt_rgt_rgt_rgt
            canine_rgt_rgt_rgt_rgt = Canine.find(canine_rgt_rgt_rgt_rgt)
            @canine_rgt_rgt_rgt_rgtname = canine_rgt_rgt_rgt_rgt.name
          else
            @canine_rgt_rgt_rgt_rgtname = ""
          end
        else
          @canine_rgt_rgt_rgtname = ""
          @canine_rgt_rgt_rgtpic = ""
          @canine_rgt_rgt_rgtid = ""
        end
      else
        @canine_rgt_rgtname = ""
        @canine_rgt_rgtpic = ""
        @canine_rgt_rgtid = ""
      end

    else
      @canine_rgtname = ""
      @canine_rgtpic = ""
      @canine_rgtid = ""
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

  def endogamia
    @array_ancestor = get_ancestor_with_hash(@canine)
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
        format.html { redirect_to admin_canines_path, notice: 'Su Canino se ha creado exitosamente' }
        format.js
        format.json { render :show, status: :created, location: @canine }
      else
        format.html { render :new }
        format.js
        format.json { render json: @canine.errors, status: :unprocessable_entity }
     end
   end
 end

  # PATCH/PUT /canines/1
  # PATCH/PUT /canines/1.json

  def update
    respond_to do |format|
      if @canine.update(canine_params)
        format.html { redirect_to admin_canine_path, notice: 'El Canino se ha modificado correctamente' }
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
    canine_nullify(@canine.id)
    @canine.destroy
    respond_to do |format|
      flash[:notice] = 'Ejemplar eliminado'
      format.js {}
      format.html { redirect_to admin_canines_path}
      format.json { head :no_content }
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_canine
      @canine = Canine.find(params[:id])
    end

    def canine_nullify(id)
      @children_lft = Canine.where("(lft = ?)", id)
      @children_lft.each do |child|
        child.update(lft: nil)
      end
      @children_lft = Canine.where("(rgt = ?)", id)
      @children_lft.each do |child|
        child.update(rgt: nil)
      end
    end

    def find_or_build_photo
      @image = params[:id] ? @canine.images.build(image_params) : @canine.images.find(params[:id])
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
      params.require(:canine).permit(:parent_id,:kind, :lft, :rgt ,:race_id, :breeder_id, :new_register, :lof, :chip, :name, :gender, :color, :father_lof, :mother_lof, :rate, :birth, :propietary, :death,images_attributes: [:id, :canine_id, :file])
    end

    def image_params
      params.require(:image).permit(:canine_id,:file, :id)
    end
end
