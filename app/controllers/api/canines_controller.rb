class Api::CaninesController < ApplicationController
  include ApplicationHelper
  respond_to :xml
  skip_before_action :verify_authenticity_token
  
  # GET /canines
  # GET /canines.xml
  def index
    if params[:q]
      @search = Canine.ransack(params[:q])
      @canines = @search.result.order(created_at: :desc)
    else
      @canines = Canine.all
    end
    # creando el hash
    @canines_list = []
    @canines.each do |canine|
      a = ["id", "#{canine.id}","nombre", "#{canine.name}", "lof", "#{canine.lof}", "gen", "#{canine.gender}"]
      h = Hash[*a]
      @canines_list << h
    end
    render :xml => @canines_list.to_xml(:root => :canines, :skip_types => true)
  end

  def show
    canine = Canine.find(params[:id])
    @pedigree = get_api_pedigree_canine(canine)
    canine_array = ["id", "#{canine.id}","nombre", "#{canine.name}", "lof", "#{canine.lof}", "gen", "#{canine.gender}"]
    root_canine = Hash[*canine_array]
    if params[:complex]
      canine_2 = Canine.find(params[:complex])
      @pedigree_2 = get_api_pedigree_canine(canine_2)
      canine_array = ["id", "#{canine_2.id}","nombre", "#{canine_2.name}", "lof", "#{canine_2.lof}", "gen", "#{canine_2.gender}"]
      root_canine_2 = Hash[*canine_array]
      render xml: { root_canine_1: root_canine, canines: @pedigree , root_canine_2: root_canine_2, canes: @pedigree_2}
    else
      render xml: { root_canine: root_canine, canines: @pedigree}
    end
  end
end
