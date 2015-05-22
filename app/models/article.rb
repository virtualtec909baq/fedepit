class Article < ActiveRecord::Base
	# default for will_paginate
  	self.per_page = 15
  	validates :title, presence: true 
  	validates :description, presence: true 
  	has_many :commnets
end
