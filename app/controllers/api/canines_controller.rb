class Api::CaninesController < ApplicationController
  include ApplicationHelper
  respond_to :json
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
      a = ["id", "#{canine.id}","nombre", "#{canine.name}", "img", "#{pic_canine(canine)}", "sex", "#{canine.gender}"]
      h = Hash[*a]
      @canines_list << h
    end
    render :json => @canines_list.to_json(:root => :canines, :skip_types => true)
  end

  def show
    canine = Canine.find(params[:id])
    @pedigree = get_api_pedigree_canine(canine, 1)
    canine_array = ["level","0","id", "#{canine.id}","nombre", "#{canine.name}", "lof", "#{canine.lof}", "gen", "#{canine.gender}"]
    root_canine = Hash[*canine_array]
    if params[:complex]
      canine_2 = Canine.find(params[:complex])
      @pedigree_2 = get_api_pedigree_canine_complex(canine_2, 1)
      canine_array = ["level","0","id", "#{canine_2.id}","nombre", "#{canine_2.name}", "lof", "#{canine_2.lof}", "gen", "#{canine_2.gender}"]
      root_canine_2 = Hash[*canine_array]
      render json: { root_canine_1: root_canine, canines: @pedigree , root_canine_2: root_canine_2, canes: @pedigree_2}
    else
      render json: { root_canine: root_canine, canines: @pedigree}
    end
  end
end
