class Article < ActiveRecord::Base
	include PublicActivity::Model
  	tracked owner: ->(controller, model) { controller && controller.current_user }
	# default for will_paginate
  	self.per_page = 15
  	# validates
	validates :title, presence: true 
  	validates :description, presence: true 
  	has_many :comments
  	has_many :paragraphs
	# img_uploader
  	mount_uploader :img, ArticleUploader
end
