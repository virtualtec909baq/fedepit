class Admin::CategoryChampionshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category_championship, only: [:show, :edit, :update, :destroy]

  # GET /category_championships
  # GET /category_championships.json
  def index
    @category_championships = CategoryChampionship.all
  end

  # GET /category_championships/1
  # GET /category_championships/1.json
  def show
  end

  # GET /category_championships/new
  def new
    @category_championship = CategoryChampionship.new
  end

  # GET /category_championships/1/edit
  def edit
  end

  # POST /category_championships
  # POST /category_championships.json
  def create
    @category_championship = CategoryChampionship.new(category_championship_params)

    respond_to do |format|
      if @category_championship.save
        format.html { redirect_to @category_championship, notice: 'Category championship was successfully created.' }
        format.json { render :show, status: :created, location: @category_championship }
      else
        format.html { render :new }
        format.json { render json: @category_championship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_championships/1
  # PATCH/PUT /category_championships/1.json
  def update
    respond_to do |format|
      if @category_championship.update(category_championship_params)
        format.html { redirect_to @category_championship, notice: 'Category championship was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_championship }
      else
        format.html { render :edit }
        format.json { render json: @category_championship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_championships/1
  # DELETE /category_championships/1.json
  def destroy
    @category_championship.destroy
    respond_to do |format|
      format.html { redirect_to category_championships_url, notice: 'Category championship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_championship
      @category_championship = CategoryChampionship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_championship_params
      params.require(:category_championship).permit(:race_id, :age_min, :age_max, :period, :variety_id)
    end
end
