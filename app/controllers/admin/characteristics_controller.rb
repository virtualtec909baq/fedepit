class Admin::CharacteristicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  # GET /features
  # GET /features.json
  def index
    @canines = Canine.all
    @search = Canine.ransack(params[:q])
    @canines = @search.result.order(name: :asc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /features/1
  # GET /features/1.json
  def show
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
        format.html { redirect_to admin_characteristic_path(@characteristic), notice: 'Metter fue creado' }
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
        flash[:notice] = 'Metter Modificado'
        format.html { redirect_to admin_characteristic_path() }
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
      format.html { redirect_to admin_canines_path, notice: 'Metter Eliminado' }
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
