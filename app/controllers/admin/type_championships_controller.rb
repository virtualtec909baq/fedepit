class Admin::TypeChampionshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_championship, only: [:show, :edit, :update, :destroy]

  # GET /type_championships
  # GET /type_championships.json
  def index
    @type_championships = TypeChampionship.all
  end

  # GET /type_championships/1
  # GET /type_championships/1.json
  def show
  end

  # GET /type_championships/new
  def new
    @type_championship = TypeChampionship.new
  end

  # GET /type_championships/1/edit
  def edit
  end

  # POST /type_championships
  # POST /type_championships.json
  def create
    @type_championship = TypeChampionship.new(type_championship_params)

    respond_to do |format|
      if @type_championship.save
        format.html { redirect_to @type_championship, notice: 'Type championship was successfully created.' }
        format.json { render :show, status: :created, location: @type_championship }
      else
        format.html { render :new }
        format.json { render json: @type_championship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_championships/1
  # PATCH/PUT /type_championships/1.json
  def update
    respond_to do |format|
      if @type_championship.update(type_championship_params)
        format.html { redirect_to @type_championship, notice: 'Type championship was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_championship }
      else
        format.html { render :edit }
        format.json { render json: @type_championship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_championships/1
  # DELETE /type_championships/1.json
  def destroy
    @type_championship.destroy
    respond_to do |format|
      format.html { redirect_to type_championships_url, notice: 'Type championship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_championship
      @type_championship = TypeChampionship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_championship_params
      params.require(:type_championship).permit(:name)
    end
end
