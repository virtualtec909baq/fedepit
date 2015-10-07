class Animation < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	
	# default for will_paginate
  self.per_page = 15
  # validates
	validates :title, presence: true 
  validates :description, presence: true 
  validates :url, presence: true 
  validates :type_category_id, presence: true 
  validates_length_of :description, :maximum => 900
	belongs_to :type_category
end
