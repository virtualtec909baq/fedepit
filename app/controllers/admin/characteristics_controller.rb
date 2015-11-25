class Admin::CharacteristicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  # GET /features
  # GET /features.json
  def index
    @characteristics = Characteristic.all.order(position: :asc)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def sort
    @characteristics = Characteristic.all
    @characteristics.each do |characteristic|
      characteristic.position = params['characteristic'].index(characteristic.id.to_s) + 1
      characteristic.save
    end
  end

  def options
  end

  def create_options
    puts params.inspect
  end

  # GET /features/1
  # GET /features/1.json
  def show
    @characteristic_details = @characteristic.characteristic_details
  end

  # GET /features/new
  def new
    @characteristic = Characteristic.new
  end

  # GET /features/1/edit
  def edit
  end

  # POST /features
  # POST /features.json
  def create
    @characteristic = Characteristic.new(feature_params)
     respond_to do |format|
      if @characteristic.save
        format.html { redirect_to admin_characteristic_path(@characteristic), notice: 'Características fue creada' }
        format.json { render :show, status: :created, location: @characteristic }
      else
        format.html { render :new }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /features/1
  # PATCH/PUT /features/1.json
  def update
    respond_to do |format|
      if @characteristic.update(feature_params)
        flash[:notice] = 'Características Modificada'
        format.html { redirect_to admin_characteristics_path(index_1: true) }
        format.json { render :show, status: :ok, location: @characteristic }
      else
        format.html { render :edit }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @characteristic.destroy
    respond_to do |format|
      format.html { redirect_to admin_characteristics_path(index_1: true), notice: 'Características Eliminada' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @characteristic = Characteristic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_params
      params.require(:characteristic).permit!
    end
end
