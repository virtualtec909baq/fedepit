class TypeBreeder < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	
	has_many :breeders, :dependent => :nullify
	# default for will_paginate
	self.per_page = 15
	# validate
	validates :name, presence: true 
end
