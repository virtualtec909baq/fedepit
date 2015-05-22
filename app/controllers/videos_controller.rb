class VideosController < ApplicationController

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

 
end
