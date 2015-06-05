class Admin::FeaturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]



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
    @feature = Feature.new
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
        format.html { redirect_to admin_canines_path, notice: 'feature was successfully created.' }
        format.json { render :show, status: :created, location: @canine }
      else
        format.html { render :new }
        format.json { render json: @canine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /features/1
  # PATCH/PUT /features/1.json
  def update
    respond_to do |format|
      if @feature.update(feature_params)
        format.html { redirect_to @feature, notice: 'Feature was successfully updated.' }
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
      format.html { redirect_to features_url, notice: 'Feature was successfully destroyed.' }
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
      params.require(:feature).permit(:skull_width, :skull_high, :skull_diameter, :head_length, :skull_length, :muzzle_high, :skull_percentage, :muzzle_percentage, :muzzle_high, :heah_high, :muzzle_high_skull, :insertion_ear, :bite_pin, :bite_crusade_inside, :bite_prognato, :bite_enognato, :bite_fork_inverted, :bite_right, :dental_full, :dental_incisor, :dental_canine, :dental_molar, :dental_premolar, :muscular_general, :muscular_masetero, :muscle_parietale, :body_long, :body_raised, :diamter_thorax, :recommendation, :title_work, :test_strength, :test_dog_safe, :championsihp, :defects_bite, :lack_dental, :postponement, :entropion, :ectropion, :displacia_elbow, :displacia_hip, :problem_conduct, :defect_tail)
    end
end
