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
    @canines = @search.result.order(name: :asc)
    @canines = @canines.uniq.page(params[:page])
    @total_canines = @canines.count
    @characteristics = Characteristic.all.order(order: :asc)
    unless params[:merge_canines]
      @canines_week = Canine.where(:created_at => (Time.now - 7.days)..(Time.now)).count
      @canines_day = Canine.where(:created_at => (Time.now.beginning_of_day)..(Time.now.end_of_day)).count
      @canines_kind_1 = Canine.where(:kind => "1").count
      @canines_kind_0 = Canine.where(:kind => "0").count
      @canine = Canine.new
    end
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
    @canino_characteristics = CaninoCharacteristic.where(canine_id: params[:id])
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

  # GET /canines/mergecanines
  def mergecanines
    @search = Canine.ransack(params[:q])
    @canines = @search.result(distinct: true)
    @array_canine_temp = get_ancestor_id(@canine)
    @root_canines = []
    get_ancestors_levels(@canine, 0).each do |key|
      key.each do |key, val|
        array_key = key.split("/")
        canine_array = [cor(get_ancestor_id(val)),  val.name, count_of_element(@array_canine_temp, val.id), array_key[0], number_to_percentage(array_key[1]) , array_key[2]]
         @root_canine = canine_array
      end
      @root_canines << @root_canine
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
    canine_nullify(@canine)
    @canine.destroy
    respond_to do |format|
      flash[:notice] = 'Ejemplar eliminado'
      format.js {}
      format.html { redirect_to admin_canines_path}
      format.json { head :no_content }
    end
  end

   def pedigree
    # papa
    if Canine.exists?(@canine.lft) 
      canine_lft = Canine.find(@canine.lft)
      @canine_lftname = canine_lft.name
      @canine_lftpic = pic_canine(canine_lft)
      @canine_lftid= canine_lft.id
    # abuelos paternos
    if Canine.exists?( canine_lft.lft)
      canine_lft_lft = Canine.find(canine_lft.lft)
      @canine_lft_lftname = canine_lft_lft.name
      @canine_lft_lftpic = pic_canine(canine_lft_lft)
      @canine_lft_lftid = canine_lft_lft.id
    if Canine.exists?(canine_lft_lft.lft)
      canine_lft_lft_lft = Canine.find(canine_lft_lft.lft)
      @canine_lft_lft_lftname = canine_lft_lft_lft.name
      @canine_lft_lft_lftpic = pic_canine(canine_lft_lft_lft)
      @canine_lft_lft_lftid = canine_lft_lft_lft.id
    if Canine.exists?(canine_lft_lft_lft.lft) 
      canine_lft_lft_lft_lft = Canine.find(canine_lft_lft_lft.lft)
      @canine_lft_lft_lft_lftname = canine_lft_lft_lft_lft.name
      @canine_lft_lft_lft_lftid = canine_lft_lft_lft_lft.id
    else
      @canine_lft_lft_lft_lftname =  ""
      @canine_lft_lft_lft_lftid = ""
    end
    if Canine.exists?(canine_lft_lft_lft.rgt)
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

    if Canine.exists?(canine_lft_lft.rgt)
      canine_lft_lft_rgt = Canine.find(canine_lft_lft.rgt)
      @canine_lft_lft_rgtname = canine_lft_lft_rgt.name
      @canine_lft_lft_rgtpic = pic_canine(canine_lft_lft_rgt)
      @canine_lft_lft_rgtid = canine_lft_lft_rgt.id
    if Canine.exists?(canine_lft_lft_rgt.lft)
      canine_lft_lft_rgt_lft = Canine.find(canine_lft_lft_rgt.lft)
      @canine_lft_lft_rgt_lftname = canine_lft_lft_rgt_lft.name
      @canine_lft_lft_rgt_lftid = canine_lft_lft_rgt_lft.id
    else
      @canine_lft_lft_rgt_lftname = ""
      @canine_lft_lft_rgt_lftid = ""
    end
    if Canine.exists?(canine_lft_lft_rgt.rgt)
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

    if Canine.exists?(canine_lft.rgt)
      canine_lft_rgt = Canine.find(canine_lft.rgt)
      @canine_lft_rgtname = canine_lft_rgt.name
      @canine_lft_rgtpic = pic_canine(canine_lft_rgt)
      @canine_lft_rgtid = canine_lft_rgt.id

    if Canine.exists?(canine_lft_rgt.lft)
      canine_lft_rgt_lft = Canine.find(canine_lft_rgt.lft)
      @canine_lft_rgt_lftname = canine_lft_rgt_lft.name
      @canine_lft_rgt_lftpic = pic_canine(canine_lft_rgt_lft)
      @canine_lft_rgt_lftid = canine_lft_rgt_lft.id
    if Canine.exists?(canine_lft_rgt_lft.lft)
      canine_lft_rgt_lft_lft = Canine.find(canine_lft_rgt_lft.lft)
      @canine_lft_rgt_lft_lftname = canine_lft_rgt_lft_lft.name
      @canine_lft_rgt_lft_lftid = canine_lft_rgt_lft_lft.id
    else
      @canine_lft_rgt_lft_lftname = ""
      @canine_lft_rgt_lft_lftid = ""
    end
    if Canine.exists?(canine_lft_rgt_lft.rgt)
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

    if Canine.exists?(canine_lft_rgt.rgt)
      canine_lft_rgt_rgt = Canine.find(canine_lft_rgt.rgt)
      @canine_lft_rgt_rgtname = canine_lft_rgt_rgt.name
      @canine_lft_rgt_rgtpic = pic_canine(canine_lft_rgt_rgt)
      @canine_lft_rgt_rgtid = canine_lft_rgt_rgt.id
    if Canine.exists?(canine_lft_rgt_rgt.lft)
      canine_lft_rgt_rgt_lft = Canine.find(canine_lft_rgt_rgt.lft)
      @canine_lft_rgt_rgt_lftname = canine_lft_rgt_rgt_lft.name
      @canine_lft_rgt_rgt_lftid = canine_lft_rgt_rgt_lft.id
    else
      @canine_lft_rgt_rgt_lftname = ""
      @canine_lft_rgt_rgt_lftid = ""
    end
    if Canine.exists?(canine_lft_rgt_rgt.rgt)
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

    if Canine.exists?(@canine.rgt)
      canine_rgt = Canine.find(@canine.rgt)
      @canine_rgtname = canine_rgt.name
      @canine_rgtpic = pic_canine(canine_rgt)
      @canine_rgtid = canine_rgt.id

    if Canine.exists?(canine_rgt.lft)
      canine_rgt_lft = Canine.find(canine_rgt.lft)
      @canine_rgt_lftname = canine_rgt_lft.name
      @canine_rgt_lftpic = pic_canine(canine_rgt_lft)
      @canine_rgt_lftid = canine_rgt_lft.id
    if Canine.exists?(canine_rgt_lft.lft)
      canine_rgt_lft_lft = Canine.find(canine_rgt_lft.lft)
      @canine_rgt_lft_lftname = canine_rgt_lft_lft.name
      @canine_rgt_lft_lftpic = pic_canine(canine_rgt_lft_lft)
      @canine_rgt_lft_lftid = canine_rgt_lft_lft.id
    if Canine.exists?(canine_rgt_lft_lft.lft)
      canine_rgt_lft_lft_lft = Canine.find(canine_rgt_lft_lft.lft)
      @canine_rgt_lft_lft_lftname = canine_rgt_lft_lft_lft.name
      @canine_rgt_lft_lft_lftpic = pic_canine(canine_rgt_lft_lft_lft)
      @canine_rgt_lft_lft_lftid = canine_rgt_lft_lft_lft.id

    if Canine.exists?(canine_rgt_lft_lft_lft.lft)
      canine_rgt_lft_lft_lft_lft = Canine.find(canine_rgt_lft_lft_lft.lft)
      @canine_rgt_lft_lft_lft_lftname = canine_rgt_lft_lft_lft_lft.name
      @canine_rgt_lft_lft_lft_lftid = canine_rgt_lft_lft_lft_lft.id
    else
      @canine_rgt_lft_lft_lft_lftname = ""
      @canine_rgt_lft_lft_lft_lftid = ""
    end
    if Canine.exists?(canine_rgt_lft_lft_lft.rgt)
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
    if Canine.exists?(canine_rgt_lft_lft.rgt)
    canine_rgt_lft_lft_rgt = Canine.find(canine_rgt_lft_lft.rgt)
    @canine_rgt_lft_lft_rgtname = canine_rgt_lft_lft_rgt.name
    @canine_rgt_lft_lft_rgtpic = pic_canine(canine_rgt_lft_lft_rgt)
    @canine_rgt_lft_lft_rgtid = canine_rgt_lft_lft_rgt.id
    if Canine.exists?(canine_rgt_lft_lft_rgt.lft)
    canine_rgt_lft_lft_rgt_lft = Canine.find(canine_rgt_lft_lft_rgt.lft)
    @canine_rgt_lft_lft_rgt_lftname = canine_rgt_lft_lft_rgt_lft.name
    @canine_rgt_lft_lft_rgt_lftid = canine_rgt_lft_lft_rgt_lft.id
    else
    @canine_rgt_lft_lft_rgt_lftname = ""
    @canine_rgt_lft_lft_rgt_lftid = ""
    end
    if Canine.exists?(canine_rgt_lft_lft_rgt.rgt)
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

    if Canine.exists?(canine_rgt.rgt)
    canine_rgt_rgt = Canine.find(canine_rgt.rgt)
    @canine_rgt_rgtname = canine_rgt_rgt.name
    @canine_rgt_rgtpic = pic_canine(canine_rgt_rgt)
    @canine_rgt_rgtid = canine_rgt_rgt.id
    if Canine.exists?(canine_rgt_rgt.lft)
    canine_rgt_rgt_lft = Canine.find(canine_rgt_rgt.lft)
    @canine_rgt_rgt_lftname = canine_rgt_rgt_lft.name
    @canine_rgt_rgt_lftpic = pic_canine(canine_rgt_rgt_lft)
    @canine_rgt_rgt_lftid = canine_rgt_rgt_lft.id
    if Canine.exists?(canine_rgt_rgt_lft.lft)
    canine_rgt_rgt_lft_lft = Canine.find(canine_rgt_rgt_lft.lft)
    @canine_rgt_rgt_lft_lftname = canine_rgt_rgt_lft_lft.name
    else
    @canine_rgt_rgt_lft_lftname = ""
    end
    if Canine.exists?(canine_rgt_rgt_lft.rgt)
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
    if Canine.exists?(canine_rgt_rgt.rgt)
    canine_rgt_rgt_rgt = Canine.find(canine_rgt_rgt.rgt)
    @canine_rgt_rgt_rgtname = canine_rgt_rgt_rgt.name
    @canine_rgt_rgt_rgtpic = pic_canine(canine_rgt_rgt_rgt)
    @canine_rgt_rgt_rgtid = canine_rgt_rgt_rgt.id
    if Canine.exists?(canine_rgt_rgt_rgt.lft)
    canine_rgt_rgt_rgt_lft = Canine.find(canine_rgt_rgt_rgt.lft)
    @canine_rgt_rgt_rgt_lftname = canine_rgt_rgt_rgt_lft.name
    else
    @canine_rgt_rgt_rgt_lftname = ""
    end
    if Canine.exists?(canine_rgt_rgt_rgt_rgt)
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_canine
    @canine = Canine.find(params[:id])
  end

  def canine_nullify(canine)
    if canine.gender.zero?
      @children_rgt = Canine.where(:rgt => canine.id)
      if !@children_rgt.empty?
        @children_rgt.update_all(rgt: nil, mother_lof: nil) 
      end
    else
      @children_lft = Canine.where(:lft => canine.id)
      if !@children_lft.empty?
        @children_lft.update_all(lft: nil, father_lof: nil)
      end
    end
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
