class Spectacle < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	# default for will_paginate
  	self.per_page = 10
  	# validates
	validates :name, presence: true 
end
