class Admin::TypeEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_event, only: [:show, :edit, :update, :destroy]

  # GET /type_events
  # GET /type_events.json
  def index
    @search = TypeEvent.ransack(params[:q])
    @type_events = @search.result.order(created_at: :desc).page(params[:page])
    @type_event = TypeEvent.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /type_events/1
  # GET /type_events/1.json
  def show
  end

  # GET /type_events/new
  def new
    @type_event = TypeEvent.new
  end

  # GET /type_events/1/edit
  def edit
  end

  # POST /type_events
  # POST /type_events.json
  def create
    @type_event = TypeEvent.new(type_event_params)

    respond_to do |format|
      if @type_event.save
        format.html { redirect_to admin_type_events_path, notice: 'Type event was successfully created.' }
        format.json { render :show, status: :created, location: @type_event }
      else
        format.html { render :new }
        format.json { render json: @type_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_events/1
  # PATCH/PUT /type_events/1.json
  def update
    respond_to do |format|
      if @type_event.update(type_event_params)
        format.html { redirect_to admin_type_events_path, notice: 'Type event was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_event }
      else
        format.html { render :edit }
        format.json { render json: @type_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_events/1
  # DELETE /type_events/1.json
  def destroy
    @type_event.destroy
    respond_to do |format|
      format.html { redirect_to admin_type_events_path, notice: 'Type event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_event
      @type_event = TypeEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_event_params
      params.require(:type_event).permit(:name, :championship)
    end
end
