class VideosController < ApplicationController

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all.order(created_at: :desc).paginate(page: params[:page], per_page: 4)

  end

 
end
