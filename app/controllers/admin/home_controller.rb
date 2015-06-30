class Admin::HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  
  def realizarcruce
     @search = Canine.ransack(params[:q])
     @canines = @search.result.includes(:feature).page(params[:page])
     @features = Feature.all
  end

  def mergecanines
    @canine = Canine.find(params[:id])
  end
end