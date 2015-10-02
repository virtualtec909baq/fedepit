class VideosController < ApplicationController

  # GET /videos
  # GET /videos.json
  def index
  	@search = Video.ransack(params[:q])
    @videos = @search.result.order(title: :desc).paginate(page: params[:page], per_page: 10)
  end
  
  def show
  	@video = Video.find(params[:id])
  	@videos = Video.last(4).reverse	
  end
end
