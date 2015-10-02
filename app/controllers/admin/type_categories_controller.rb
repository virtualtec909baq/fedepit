class Admin::TypeCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_event, only: [:show, :edit, :update, :destroy]

  # GET /type_events
  # GET /type_events.json
  def index
    @search = TypeCategory.ransack(params[:q])
    @type_categories = @search.result.order(created_at: :desc).page(params[:page])
    @type_category = TypeCategory.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /type_events/1
  # GET /type_events/1.json
  def show
  end

  # GET /type_events/new
  def new
    @type_category = TypeCategory.new
  end

  # GET /type_events/1/edit
  def edit
  end

  # POST /type_events
  # POST /type_events.json
  def create
    @type_category = TypeCategory.new(type_category_params)

    respond_to do |format|
      if @type_category.save
        format.html { redirect_to admin_type_categories_path, notice: 'la categoria del video fue creada' }
        format.json { render :show, status: :created, location: @type_category }
      else
        format.html { render :new }
        format.json { render json: @type_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_events/1
  # PATCH/PUT /type_events/1.json
  def update
    respond_to do |format|
      if @type_category.update(type_category_params)
        format.html { redirect_to admin_type_categories_path, notice: 'la categoria del video fue modificada' }
        format.json { render :show, status: :ok, location: @type_category }
      else
        format.html { render :edit }
        format.json { render json: @type_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_events/1
  # DELETE /type_events/1.json
  def destroy
    @type_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_type_categories_path, notice: 'Type event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_event
      @type_category = TypeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_category_params
      params.require(:type_category).permit(:description)
    end
end
