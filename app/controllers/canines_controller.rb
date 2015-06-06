class CaninesController < ApplicationController

  # GET /canines
  # GET /canines.json
  # GET /canines
  # GET /canines.json
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
  
end
