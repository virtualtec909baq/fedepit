class CategoryRaceVariety < ActiveRecord::Base
	before_save :concatenate_details
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	# default for will_paginate
	self.per_page = 15
	# validates
	validates :race_id, presence: true
	validates :variety_id, presence: true
	validates :category_id, presence: true
	validates :tournament_id, presence: true

	has_many :canines, :through => :champions
  	has_many :champions 
  	
  	def concatenate_details
     self.name = "#{Race.find(race_id).name} #{Variety.find(variety_id).name} #{Category.find(category_id).name}#{Tournament.find(tournament_id).name}"
  	end
end
