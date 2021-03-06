class Admin::BreedersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_breeder, only: [:show, :edit, :update, :destroy]

  # GET /breeders
  # GET /breeders.json
  def index
    @search = Breeder.ransack(params[:q])
    @breeders = @search.result.order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /breeders/1
  # GET /breeders/1.json
  def show
    @canines = @breeder.canines
  end

  # GET /breeders/new
  def new
    @breeder = Breeder.new
  end

  # GET /breeders/1/edit
  def edit
  end

  # POST /breeders
  # POST /breeders.json
   def create
    @breeder = Breeder.new(breeder_params)

    respond_to do |format|
      if @breeder.save
        format.html { redirect_to admin_breeders_path, notice: 'Criado fue creado' }
        format.json { render :show, status: :created, location: @breeder }
      else
        format.html { render :new }
        format.json { render json: @breeder.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /breeders/1
  # PATCH/PUT /breeders/1.json
  def update
    respond_to do |format|
      if @breeder.update(breeder_params)
        format.html { redirect_to admin_breeders_path, notice: 'Criado fue modificado' }
        format.json { render :show, status: :ok, location: @breeder }
      else
        format.html { render :edit }
        format.json { render json: @breeder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breeders/1
  # DELETE /breeders/1.json
  def destroy
    @breeder.destroy
    respond_to do |format|
      flash[:notice] = 'Criador eliminado'
      format.html { redirect_to admin_breeders_path}
      format.json { head :no_content }
    end
  end

  def send_email
  end

  def send_mail_attachments
    @name = params[:name]
    @email = params[:email]
    NotificationMailer.send_email(@name, @email).deliver_now
    redirect_to admin_breeders_send_email_path, notice: 'Formulario enviado'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breeder
      @breeder = Breeder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def breeder_params
      params.require(:breeder).permit(:type_breeder_id, :name, :phone, :email, :name_breed, :facebook, :twitter, :instagram, :web, :img, :country, :city, :adrress)
    end
end
