class EventsController < ApplicationController

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.order(created_at: :desc).paginate(page: params[:page], per_page: 4)
  end

end
