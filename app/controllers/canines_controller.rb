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
<<<<<<< HEAD
  end

  def show
    @canine = Canine.find(params[:id])
    @images = @canine.images
    @canine_awards = @canine.events
    @feature = @canine.feature
=======
>>>>>>> 9f5d0e1e9f1ae3b2a815194d085346ae795fa609
  end
  
end
