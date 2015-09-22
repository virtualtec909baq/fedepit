class Race < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	has_many :canines, :dependent => :nullify
	has_many :img_races, :dependent => :destroy
	
	# default for will_paginate
  	self.per_page = 15
  	# validates
	validates :name, presence: true 
	validates :description, presence: true
  	# pdf_uploader
	mount_uploader :pdf, RaceUploader	 
end
