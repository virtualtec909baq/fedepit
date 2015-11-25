class Admin::CharacteristicDetailsController < ApplicationController
  before_action :authenticate_user!
	before_action :set_feature, only: [:edit, :update, :destroy]
  def edit
  end

  # PATCH/PUT /characteristic_details/1
  # PATCH/PUT /characteristic_details/1.json
  def update
    respond_to do |format|
      if @characteristic_detail.update(feature_params)
        flash[:notice] = 'Características Modificada'
        format.html { redirect_to admin_characteristic_path(session[:characteristic]) }
        format.json { render :show, status: :ok, location: @characteristic_detail }
      else
        format.html { render :edit }
        format.json { render json: @characteristic_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characteristic_details/1
  # DELETE /characteristic_details/1.json
  def destroy
    @characteristic_detail.destroy
    respond_to do |format|
      format.html { redirect_to admin_characteristic_path(session[:characteristic]), notice: 'Características Eliminada' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @characteristic_detail = CharacteristicDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_params
      params.require(:characteristic_detail).permit!
    end
end