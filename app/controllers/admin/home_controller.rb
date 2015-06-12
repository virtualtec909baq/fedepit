class Admin::HomeController < ApplicationController
	before_action :authenticate_user!

	def index
	end
	def realizarcruce
    	@canine = Canine.new
  	end
end
