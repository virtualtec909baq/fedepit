class Admin::StandardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_standard, only: [:show, :edit, :update, :destroy, :change_status]

  # GET /sponsors
  # GET /sponsors.json
  
  def index
    @search = Standard.ransack(params[:q])
    @standards = @search.result.order(created_at: :desc).page(params[:page])
    @standard = Standard.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /sponsors/1
  # GET /sponsors/1.json
  def show
  end

  # GET /sponsors/1/edit
  def edit
  end

  def create
    @standard = Standard.new(standard_params)
    respond_to do |format|
      if @standard.save
        format.html { redirect_to admin_standards_path, notice: 'El estandar de raza fue creado' }
        format.json { render :show, status: :created, location: @standard }
        format.js{}
      else
        format.html { render :new }
        format.js
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsors/1
  # PATCH/PUT /sponsors/1.json
  def update
    respond_to do |format|
      if @standard.update(standard_params)
        format.html { redirect_to admin_standards_path, notice: 'El estandar de raza fue Modificado' }
        format.json { render :show, status: :ok, location: @standard }
      else
        format.html { render :edit }
        format.json { render json: @standard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @standard.destroy
    respond_to do |format|
      format.html { redirect_to admin_standards_path, notice: 'El estandar de raza fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard
      @standard = Standard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_params
      params.require(:standard).permit!
    end
end
