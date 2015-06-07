class Admin::CaninesController < ApplicationController
  autocomplete :canine, :name, :full => true
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
  end

  # GET /canines/1
  # GET /canines/1.json
  def pedigree
    if !@canine.lft.nil? or !@canine.rgt.nil?
      @father = Canine.find(@canine.lft)
      
      if !@father.lft.nil? or !@father.rgt.nil?
        
        @paternal_grandfather = Canine.find(@father.lft)
        
        if !@paternal_grandfather.lft.nil? or !@paternal_grandfather.rgt.nil?
          @paternal_great_grandfather = Canine.find(@paternal_grandfather.lft)
          if !@paternal_great_grandfather.lft.nil? or !@paternal_great_grandfather.rgt.nil?
            @paternal_great_mother_maternal_great_grandfather = Canine.find(@paternal_great_grandfather.lft)
            @paternal_great_mother_paternal_great_grandmother = Canine.find(@paternal_great_grandfather.rgt)
          end
          @paternal_great_grandmother = Canine.find(@paternal_grandfather.rgt)
          # 191
          if !@paternal_great_grandmother.lft.nil? or !@paternal_great_grandmother.rgt.nil?
            @paternal_paternal_great_mother_maternal_great_grandfather = Canine.find(@paternal_great_grandmother.lft)
            @paternal_paternal_great_mother_paternal_great_grandmother = Canine.find(@paternal_great_grandmother.rgt)
          end
        end
        
        @paternal_grandmother = Canine.find(@father.rgt)

        if !@paternal_grandmother.lft.nil? or !@paternal_grandmother.rgt.nil?
          @maternal_great_grandfather = Canine.find(@paternal_grandmother.lft)
            if !@maternal_great_grandfather.lft.nil? or !@maternal_great_grandfather.rgt.nil? 
              @maternal_great_paternal_great_mother_maternal_great_grandfather = Canine.find(@maternal_great_grandfather.lft)
              @maternal_great_paternal_great_mother_paternal_great_grandmother = Canine.find(@maternal_great_grandfather.rgt)
            end

          @maternal_great_grandmother = Canine.find(@paternal_grandmother.rgt)
        end
      end
      
      @mother = Canine.find(@canine.rgt)
      if !@mother.lft.nil? or !@mother.rgt.nil?
        @maternal_grandfather = Canine.find(@mother.lft)
          if !@maternal_grandfather.lft.nil? or !@maternal_grandfather.rgt.nil?
            @mother_maternal_great_grandfather = Canine.find(@maternal_grandfather.lft)
            @mother_paternal_great_grandmother = Canine.find(@maternal_grandfather.rgt)
          end
        @maternal_grandmother = Canine.find(@mother.rgt)
          if !@maternal_grandmother.lft.nil? or !@maternal_grandmother.rgt.nil?
            @father_maternal_great_grandfather = Canine.find(@maternal_grandmother.lft)
            @father_paternal_great_grandmother = Canine.find(@maternal_grandmother.rgt)
          end
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
