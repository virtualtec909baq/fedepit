class Video < ActiveRecord::Base
	# default for will_paginate
  	self.per_page = 15
  	  	# validates
	validates :title, presence: true 
  	validates :description, presence: true 
  	validates :url, presence: true 

  	belongs_to :type_category

end
