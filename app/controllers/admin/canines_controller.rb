class Admin::CaninesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_canine, only: [:show, :edit, :update, :destroy]

  # GET /canines
  # GET /canines.json
  def index
    @canines = Canine.all
  end

  # GET /canines/1
  # GET /canines/1.json
  def show
  end

  # GET /canines/new
  def new
    @canine = Canine.new
  end

  # GET /canines/1/edit
  def edit
  end

  # POST /canines
  # POST /canines.json
  def create
    @canine = Canine.new(canine_params)

    respond_to do |format|
      if @canine.save
        format.html { redirect_to @canine, notice: 'Canine was successfully created.' }
        format.json { render :show, status: :created, location: @canine }
      else
        format.html { render :new }
        format.json { render json: @canine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canines/1
  # PATCH/PUT /canines/1.json
  def update
    respond_to do |format|
      if @canine.update(canine_params)
        format.html { redirect_to @canine, notice: 'Canine was successfully updated.' }
        format.json { render :show, status: :ok, location: @canine }
      else
        format.html { render :edit }
        format.json { render json: @canine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canines/1
  # DELETE /canines/1.json
  def destroy
    @canine.destroy
    respond_to do |format|
      format.html { redirect_to canines_url, notice: 'Canine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_canine
      @canine = Canine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canine_params
      params.require(:canine).permit(:race_id, :breeder_id, :lof, :chip, :name, :gender, :color_id, :father_lof, :mother_lof, :rate, :birth, :death)
    end
end
