class CaninesController < ApplicationController
  include ApplicationHelper
  def index
    @canines = Canine.all
    @search = Canine.ransack(params[:q])
    @canines = @search.result.order(created_at: :desc).page(params[:page])
    @canine = Canine.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index2
    @canines = Canine.all
    @search = Canine.ransack(params[:q])
    @canines = @search.result.order(created_at: :desc).page(params[:page])
    @canine = Canine.new
    respond_to do |format|
      format.html
      format.js
    end  
  end

  def mergecanines
    @canine = Canine.find(params[:id])
    @search = Canine.ransack(params[:q])
    @canines = @search.result(distinct: true)
  end

   def show
    @canine = Canine.find(params[:id])
   @images = @canine.images
   @array_ancestor = get_ancestor_with_hash(@canine).count
   @canino_characteristics = CaninoCharacteristic.where(canine_id: params[:id]).order(created_at: :asc)
   respond_to do |format|
     format.html
     format.pdf do
        pdf = CaninePdf.new(@canine)
        send_data pdf.render, filename: "generate_table.pdf",
                              type: "application/pdf",
                              disposition: "inline"
     end
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
