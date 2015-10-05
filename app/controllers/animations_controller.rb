class AnimationsController < ApplicationController
  # GET /videos
  # GET /videos.json
  def index
    @search = Animation.ransack(params[:q])
    @animations = @search.result.order(title: :desc).paginate(page: params[:page], per_page: 10)
  end
  
  def show
    @animation = Animation.find(params[:id])
    @animations = Animation.last(4).reverse 
  end
end
