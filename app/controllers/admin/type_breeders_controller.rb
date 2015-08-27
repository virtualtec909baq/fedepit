class Admin::TypeBreedersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_breeder, only: [:show, :edit, :update, :destroy]

  # GET /type_breeders
  # GET /type_breeders.json
  def index
    @type_breeders = TypeBreeder.all.order(created_at: :desc).page(params[:page])
    @type_breeder = TypeBreeder.new()

  end

  # GET /type_breeders/1
  # GET /type_breeders/1.json
  def show
  end

  # GET /type_breeders/new
  def new
    @type_breeder = TypeBreeder.new
  end

  # GET /type_breeders/1/edit
  def edit
  end

  # POST /type_breeders
  # POST /type_breeders.json
  def create
    @type_breeder = TypeBreeder.new(type_breeder_params)

    respond_to do |format|
      if @type_breeder.save
        format.html { redirect_to admin_type_breeders_url, notice: 'Type breeder was successfully created.' }
        format.json { render :show, status: :created, location: @type_breeder }
      else
        format.html { render :new }
        format.json { render json: @type_breeder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_breeders/1
  # PATCH/PUT /type_breeders/1.json
  def update
    respond_to do |format|
      if @type_breeder.update(type_breeder_params)
        format.html { redirect_to admin_type_breeders_url, notice: 'Type breeder was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_breeder }
      else
        format.html { render :edit }
        format.json { render json: @type_breeder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_breeders/1
  # DELETE /type_breeders/1.json
  def destroy
    @type_breeder.destroy
    respond_to do |format|
      format.html { redirect_to admin_type_breeders_url, notice: 'Type breeder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_breeder
      @type_breeder = TypeBreeder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_breeder_params
      params.require(:type_breeder).permit(:name)
    end
end
