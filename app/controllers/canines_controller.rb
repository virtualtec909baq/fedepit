class CaninesController < ApplicationController
  def index
    @canines = Canine.all
    @search = Canine.ransack(params[:q])
    @canines = @search.result.order(created_at: :desc).page(params[:page])
    @canine = Canine.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @canine = Canine.find(params[:id])
    @images = @canine.images
    @canine_awards = @canine.events
    @feature = @canine.feature
  end

  def realizarcruce
    @feature = Feature.new
  end
end
