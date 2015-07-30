class Race < ActiveRecord::Base
	has_many :canines, :dependent => :nullify
	# default for will_paginate
  	self.per_page = 15
  	# validates
	validates :name, presence: true 
	validates :description, presence: true
  	# pdf_uploader
	mount_uploader :pdf, RaceUploader	 
end
