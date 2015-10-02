class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @search = Event.ransack(params[:q])
    @events = @search.result.order(created_at: :desc).page(params[:page])
    @event = Event.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @events = Event.last(4).reverse 
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_events_path, notice: 'El evento fue creador' }
        format.json { render :show, status: :created, location: @event }
      else
        format.js
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to admin_events_path, notice: 'El evento fue modificado' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
    def destroy
    @event.destroy
    respond_to do |format|
      flash[:notice] = 'Evento eliminado'
      format.html { redirect_to admin_events_path}
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:type_event_id, :name, :description, :date, :place, :img)
    end
end
