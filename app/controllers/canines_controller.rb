class CaninesController < ApplicationController
  include ApplicationHelper
  def index
    @canines = Canine.all
    @search = Canine.ransack(params[:q])
    @canines = @search.result.order(name: :ASC).paginate(page: params[:page], per_page: 12)
    @canine = Canine.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def endogamia
    @canine = Canine.find(params[:id])
    @array_ancestor = get_ancestor_with_hash(@canine)
  end
  
  def pedigree
    @canine = Canine.find(params[:id])
    @array_ancestor = get_pedigree_canine(@canine, 1)
  end

  def show
    @canine = Canine.find(params[:id])
    @images = @canine.images
    @array_ancestor = get_ancestor_with_hash(@canine).count
    @ranking = 0
    @canine.champions.each do |category|
      @ranking = @ranking + category.points
    end
    @canino_characteristics = CaninoCharacteristic.where(canine_id: params[:id]).order(created_at: :asc)
    respond_to do |format|
     format.html
    end
  end

  def realizarcruce
    @feature = Feature.new
  end

  def merge_canine
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
