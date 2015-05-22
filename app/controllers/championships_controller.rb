class ChampionshipsController < ApplicationController

  # GET /championships
  # GET /championships.json
  def index
    @championships = Championship.all
  end

 end
