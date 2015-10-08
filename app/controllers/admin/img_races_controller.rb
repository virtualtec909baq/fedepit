class Admin::ImgRacesController < ApplicationController 
	before_action :authenticate_user!
	before_action :set_image, only: [:edit, :update, :destroy]
	
	def update
  	respond_to do |format|
  		if @image.update(event_params)
        @race = Race.find(@image.race_id)
  			format.html { redirect_to admin_race_path(@race), notice: 'la imagen fue modificado' }
  			format.json { render :show, status: :ok, location: @image }
  		else
  			format.html { render :edit }
  			format.json { render json: @image.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def edit
  end
  
  def destroy
  	@race = Race.find(@image.race_id)
  	@image.destroy
  	respond_to do |format|
  		flash[:notice] = 'Imagen eliminada'
  		format.html { redirect_to admin_race_path(@race)}
  		format.json { head :no_content }
  	end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image
  	@image = ImgRace.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
  	params.require(:img_race).permit(:img, :description)
  end
end