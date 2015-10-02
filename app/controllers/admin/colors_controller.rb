class Admin::ColorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_color, only: [:show, :edit, :update, :destroy]

  # GET /colors
  # GET /colors.json
  def index
    @search = Color.ransack(params[:q])
    @colors = @search.result.order(created_at: :desc).page(params[:page])
    @color = Color.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /colors/1
  # GET /colors/1.json
  def show
  end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # GET /colors/1/edit
  def edit
  end

  # POST /colors
  # POST /colors.json
  def create
    @color = Color.new(color_params)
    respond_to do |format|
      if @color.save
        format.html { redirect_to admin_colors_path, notice: 'El color fue creador' }
        format.js
        format.json { render :show, status: :created, location: @color }
      else
        format.html { render :new }
        format.js
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colors/1
  # PATCH/PUT /colors/1.json
  def update
    respond_to do |format|
      if @color.update(color_params)
        format.html { redirect_to admin_colors_path, notice: 'El color fue modificado' }
        format.json { render :show, status: :ok, location: @color }
      else
        format.html { render :edit }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colors/1
  # DELETE /colors/1.json
  def destroy
    @color.destroy
    respond_to do |format|
      flash[:notice] = 'color eliminado'
      format.html { redirect_to admin_colors_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def color_params
      params.require(:color).permit(:name)
    end
end
