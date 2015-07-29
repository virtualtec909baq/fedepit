class Admin::ImagesController < ApplicationController 
	def destroy
		@image = Image.find(params[:id])
		@canine = Canine.find(params[:canine_id])
	    @image.destroy
	    respond_to do |format|
	      flash[:notice] = 'Imagen eliminada'
	      format.html { redirect_to edit_admin_canine_path(@canine)}
	      format.json { head :no_content }
	    end
  end
end