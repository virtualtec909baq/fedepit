class BreedersController < ApplicationController

  # GET /breeders
  # GET /breeders.json
  def index
    @breeders = Breeder.where(type_breeder_id: 31)
  end
  def show
  	@breeder = Breeder.find(params[:id])
  end

end
