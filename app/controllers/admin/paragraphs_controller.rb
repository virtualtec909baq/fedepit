class Admin::ParagraphsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_event, only: [:show, :edit, :update, :destroy]

  # GET /type_events/new
  def new
    @paragraph = Paragraph.new
  end

  # GET /type_events/1/edit
  def edit
    puts "@paragraph"
  end

  # POST /type_events
  # POST /type_events.json
  def create
    @paragraph = Paragraph.new(type_category_params)

    respond_to do |format|
      if @paragraph.save
        format.html { redirect_to admin_article_path(@paragraph.article_id), notice: 'Su Parrafo fue creado.' }
        format.json { render :show, status: :created, location: @paragraph }
      else
        format.html { render :new }
        format.js { render :new }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_events/1
  # PATCH/PUT /type_events/1.json
  def update
    puts "aquiiiii"
    respond_to do |format|
      if @paragraph.update(type_category_params)
        format.html { redirect_to admin_article_path(@paragraph.article_id), notice: 'Su Parrafo fue modificado correctamente.' }
        format.json { render :show, status: :ok, location: @paragraph }
      else
        format.html { render :edit }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_events/1
  # DELETE /type_events/1.json
  def destroy
    @paragraph.destroy
    respond_to do |format|
      format.html { redirect_to admin_article_path(@paragraph.article_id), notice: 'Type event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_event
      @paragraph = Paragraph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_category_params
      params.require(:paragraph).permit(:description, :img, :article_id)
    end
end
