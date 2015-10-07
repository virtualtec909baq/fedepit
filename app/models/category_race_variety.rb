class CategoryRaceVariety < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	# default for will_paginate
	self.per_page = 15
	# validates
	validates :race_id, presence: true
	validates :variety_id, presence: true
	validates :category_id, presence: true
	validates :tournament_id, presence: true
end
