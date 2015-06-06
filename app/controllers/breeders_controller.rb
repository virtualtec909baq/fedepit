class BreedersController < ApplicationController

  # GET /breeders
  # GET /breeders.json
  def index
    @breeders = Breeder.all
  end
  def show
  	@breeder = Breeder.find(params[:id])
  end

end
