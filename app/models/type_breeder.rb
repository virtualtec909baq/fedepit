class TypeBreeder < ActiveRecord::Base
	
	has_many :breeders, :dependent => :nullify
	# default for will_paginate
	self.per_page = 15
	validates :name, presence: true 
end
