class Article < ActiveRecord::Base
	  # default for will_paginate
  	self.per_page = 15
  	# validates
	  validates :title, presence: true 
  	validates :description, presence: true 
    validates_length_of :description, :maximum => 2000
    validates_length_of :description, :minimum => 200
  	# img_uploader
    mount_uploader :img, ArticleUploader
    
    has_many :comments, :dependent => :destroy
  	has_many :paragraphs, :dependent => :destroy
    accepts_nested_attributes_for :paragraphs, allow_destroy: true
	  
end
