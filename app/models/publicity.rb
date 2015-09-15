class Publicity < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	after_initialize :init
	# default for will_paginate
	self.per_page = 15
	# validates
   validates :name, presence: true 
	# img_uploader
	mount_uploader :image, PublicityUploader

	def init
		self.status  ||= false
	end
end
