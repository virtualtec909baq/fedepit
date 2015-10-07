class Admin::PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  # GET /positions
  # GET /positions.json
  
  def index
    @search = Position.ransack(params[:q])
    @positions = @search.result.order(place: :asc).page(params[:page])
    @position = Position.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
  end

  # GET /positions/new
  def new
    @position = Position.new
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to admin_positions_path, notice: 'Puesto ha sido creado.' }
        format.json { render :show, status: :created, location: @position }
        format.js{}
      else
        format.js{}
        format.html { render :new }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to admin_positions_path, notice: 'Puesto ha sido modificado.' }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to admin_positions_path, notice: 'Puesto ha sido eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_params
      params.require(:position).permit(:place)
    end
end
