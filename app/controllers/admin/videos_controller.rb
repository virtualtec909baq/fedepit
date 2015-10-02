class Admin::VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @search = Video.ransack(params[:q])
    @videos = @search.result.order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @videos = Video.last(4).reverse 
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
 
  def create
    @video = Video.new(video_params)
    respond_to do |format|
      if @video.save
        flash[:notice] = 'Video Creado'
        format.html { redirect_to admin_video_path(@video) }
        format.json { render :show, status: :ok, location: @video }
        format.js
      else
        format.js
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.save(video_params)
        flash[:notice] = 'Video modificado'
        format.html { redirect_to admin_video_path(@video) }
        format.json { render :show, status: :ok, location: @video }
        format.js
      else
        flash[:notice] = 'Video no puede ser modificado'
        format.html { render :edit }
        format.js
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      flash[:notice] = 'Video eliminado'
      format.html { redirect_to admin_videos_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :number_seen, :url, :description, :type_category_id)
    end
end
