class Admin::CategoryRaceVarietiesController < ApplicationController
  before_action :set_category_race_variety, only: [:show, :edit, :update, :destroy]
  
  # GET /category_race_varieties
  # GET /category_race_varieties.json
  def index
    @category_race_varieties = CategoryRaceVariety.all
  end
  def index
    @search = CategoryRaceVariety.ransack(params[:q])
    @category_race_variety = CategoryRaceVariety.new
    @category_race_varieties = @search.result.order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end
  # GET /category_race_varieties/1
  # GET /category_race_varieties/1.json
  def show
  end

  # GET /category_race_varieties/new
  def new
    @category_race_variety = CategoryRaceVariety.new
  end

  # GET /category_race_varieties/1/edit
  def edit
  end

  # POST /category_race_varieties
  # POST /category_race_varieties.json
  def create
    @category_race_variety = CategoryRaceVariety.new(category_race_variety_params)

    respond_to do |format|
      if @category_race_variety.save
        format.html { redirect_to admin_category_race_varieties_path, notice: 'Category race variety was successfully created.' }
        format.json { render :show, status: :created, location: @category_race_variety }
        format.js{}
      else
        format.js{}
        format.html { render :new }
        format.json { render json: @category_race_variety.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_race_varieties/1
  # PATCH/PUT /category_race_varieties/1.json
  def update
    respond_to do |format|
      if @category_race_variety.update(category_race_variety_params)
        format.html { redirect_to admin_category_race_varieties_path, notice: 'Category race variety was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_race_variety }
      else
        format.html { render :edit }
        format.json { render json: @category_race_variety.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_race_varieties/1
  # DELETE /category_race_varieties/1.json
  def destroy
    @category_race_variety.destroy
    respond_to do |format|
      format.html { redirect_to admin_category_race_varieties_path, notice: 'Category race variety was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_category_race_variety
      @category_race_variety = CategoryRaceVariety.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_race_variety_params
      params.require(:category_race_variety).permit(:race_id, :variety_id, :category_id, :tournament_id, :punctuation)
    end
end
