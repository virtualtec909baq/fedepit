class EventsController < ApplicationController

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.order(created_at: :desc).paginate(page: params[:page], per_page: 9)
  end
  
  def show
  	@event = Event.find(params[:id])
  	@events = Event.last(4).reverse	
  end

end
