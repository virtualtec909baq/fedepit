class Admin::PublicitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_publicity, only: [:show, :edit, :update, :destroy]

  # GET /publicities
  # GET /publicities.json
  def index
    @search = Publicity.ransack(params[:q])
    @publicities = @search.result.order(created_at: :desc).page(params[:page])
    @publicity = Publicity.new
    respond_to do |format|
      format.html
      format.js
    end
  end
  # GET /publicities/1
  # GET /publicities/1.json
  def show
  end

  # GET /publicities/new
  def new
    @publicity = Publicity.new
  end

  # GET /publicities/1/edit
  def edit
  end

  # POST /publicities
  # POST /publicities.json
  def create
    @publicity = Publicity.new(publicity_params)

    respond_to do |format|
      if @publicity.save
        format.html { redirect_to admin_publicities_path, notice: 'Publicidad Creada' }
        format.json { render :show, status: :created, location: @publicity }
      else
        format.html { render :new }
        format.json { render json: @publicity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publicities/1
  # PATCH/PUT /publicities/1.json
   def update
    respond_to do |format|
      if @publicity.update(publicity_params)
        format.html { redirect_to admin_publicities_path, notice: 'La publicidad fue modificada' }
        format.json { render :show, status: :ok, location: @publicity }
      else
        format.html { render :edit }
        format.json { render json: @publicity.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_status 
    @publicity = Publicity.find(params[:id])
    val = @publicity.status == true ? false : true
    @publicity.update_attribute(:status, val)  
    respond_to do |format|
      flash[:notice] = 'Publicidad Modificado'
      format.html { redirect_to admin_publicities_path }
    end    
  end

  # DELETE /publicities/1
  # DELETE /publicities/1.json
  def destroy
    @publicity.destroy
    respond_to do |format|
      flash[:notice] = 'Publicidad eliminada'
      format.html { redirect_to admin_publicities_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicity
      @publicity = Publicity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publicity_params
      params.require(:publicity).permit(:image, :name, :status)
    end
end
