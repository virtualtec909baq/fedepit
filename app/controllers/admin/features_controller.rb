class Admin::FeaturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  # GET /features
  # GET /features.json
  def index
    @search = Feature.ransack(params[:q])
    @features = @search.result.order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /features/1
  # GET /features/1.json
  def show
  end

  # GET /features/new
  def new
    @result_exist = Feature.exists?(canine_id: params[:canine_id])
    if @result_exist
     @feature = Feature.find_by_canine_id(params[:canine_id])
    else
      @feature = Feature.new
    end
  end

  # GET /features/1/edit
  def edit
  end

  # POST /features
  # POST /features.json
  def create
    @feature = Feature.new(feature_params)
     respond_to do |format|
      if @feature.save
        format.html { redirect_to admin_features_path, notice: 'feature was successfully created.' }
        format.json { render :show, status: :created, location: @feature }
      else
        format.html { render :new }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /features/1
  # PATCH/PUT /features/1.json
  def update
    
    respond_to do |format|
      if @feature.update(feature_params)
        flash[:notice] = 'metter modificado'
        format.html { redirect_to admin_features_path }
        format.json { render :show, status: :ok, location: @feature }
      else
        format.html { render :edit }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to admin_features_path, notice: 'Feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_params
      params.require(:feature).permit!
    end
end
