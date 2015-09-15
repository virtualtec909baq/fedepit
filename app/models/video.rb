class Video < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	# default for will_paginate
  	self.per_page = 15
  	  	# validates
	validates :title, presence: true 
  	validates :description, presence: true 
  	validates :url, presence: true 

  	belongs_to :type_category

end
