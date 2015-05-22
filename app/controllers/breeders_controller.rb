class BreedersController < ApplicationController

  # GET /breeders
  # GET /breeders.json
  def index
    @breeders = Breeder.all
  end

end
