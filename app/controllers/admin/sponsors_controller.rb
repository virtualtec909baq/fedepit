class Admin::SponsorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy, :change_status]

  # GET /sponsors
  # GET /sponsors.json
  
  def index
    @search = Sponsor.ransack(params[:q])
    @sponsors = @search.result.order(created_at: :desc).page(params[:page])
    @sponsor = Sponsor.new
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
    @sponsor = Sponsor.new(sponsor_params)
    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to admin_sponsors_path, notice: 'El patrocinador fue creado' }
        format.json { render :show, status: :created, location: @sponsor }
        format.js{}
      else
        format.html { render :new }
        format.js
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsors/1
  # PATCH/PUT /sponsors/1.json
  def update
    respond_to do |format|
      if @sponsor.update(sponsor_params)
        format.html { redirect_to admin_sponsors_path, notice: 'El patrocinador fue Modificado' }
        format.json { render :show, status: :ok, location: @sponsor }
      else
        format.html { render :edit }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_status 
    val = @sponsor.status == true ? false : true
    puts val
    @sponsor.update_attribute(:status, val)
    respond_to do |format|
      flash[:notice] = 'Patrocinador Modificado'
      format.html { redirect_to admin_sponsors_path }
    end    
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor.destroy
    respond_to do |format|
      format.html { redirect_to admin_sponsors_path, notice: 'El patrocinador fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_params
      params.require(:sponsor).permit(:image, :status, :url, :name, :email)
    end
end
