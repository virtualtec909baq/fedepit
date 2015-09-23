class Race < ActiveRecord::Base
	has_many :canines, :dependent => :nullify
	has_many :img_races, :dependent => :destroy
	accepts_nested_attributes_for :img_races, allow_destroy: true,:reject_if  => :all_blank
	# default for will_paginate
  	self.per_page = 15
  	# validates
	validates :name, presence: true 
	validates :description, presence: true
  	# pdf_uploader
	mount_uploader :pdf, RaceUploader	 
end
