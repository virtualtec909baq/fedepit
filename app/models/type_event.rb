class TypeEvent < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	after_initialize :init

	# default for will_paginate
	self.per_page = 15
	# validates
	validates :name, presence: true 
	has_many :events
	def init
  		self.championship  ||= false
  	end
end
