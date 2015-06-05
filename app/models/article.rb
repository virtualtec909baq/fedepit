class Article < ActiveRecord::Base
	# default for will_paginate
  	self.per_page = 15
  	# validates
	validates :title, presence: true 
  	validates :description, presence: true 
  	has_many :comments
	# img_uploader
  	mount_uploader :img, ArticleUploader
end
