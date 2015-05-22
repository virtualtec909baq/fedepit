class CaninesController < ApplicationController

  # GET /canines
  # GET /canines.json
  def index
    @canines = Canine.all
  end
  
end
