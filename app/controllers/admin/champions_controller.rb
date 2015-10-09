class Admin::ChampionsController < ApplicationController
  before_action :set_champion, only: [:show, :edit, :update, :destroy]

  # GET /champions
  # GET /champions.json
  def index
    @champions = Champion.all
    @champion = Champion.new
  end

  # GET /champions/1
  # GET /champions/1.json
  def show
  end

  # GET /champions/new
  def new
    @champion = Champion.new
  end

  # GET /champions/1/edit
  def edit
  end

  # POST /champions
  # POST /champions.json
  def create
    @champion = Champion.new(champion_params)

    respond_to do |format|
      if @champion.save
        format.html { redirect_to admin_champions_path, notice: 'Campeon ha sido creador.' }
        format.json { render :show, status: :created, location: @champion }
        format.js {}
      else
        format.js {}
        format.html { render :new }
        format.json { render json: @champion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /champions/1
  # PATCH/PUT /champions/1.json
  def update
    respond_to do |format|
      if @champion.update(champion_params)
        format.html { redirect_to admin_champions_path, notice: 'Campeon ha sido modificado' }
        format.json { render :show, status: :ok, location: @champion }
      else
        format.html { render :edit }
        format.json { render json: @champion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /champions/1
  # DELETE /champions/1.json
  def destroy
    @champion.destroy
    respond_to do |format|
      format.html { redirect_to admin_champions_path, notice: 'Campeon ha sido eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_champion
      @champion = Champion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def champion_params
      params.require(:champion).permit(:canine_id, :category_race_variety_id, :spectacle_id, :date, :points, :position)
    end
end
