class VideosController < ApplicationController

  # GET /videos
  # GET /videos.json
  def index
  	@search = Video.ransack(params[:q])
    @videos = @search.result.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
  end
  
  def show
  	@video = Video.find(params[:id])
  end
end
