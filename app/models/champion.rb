class Champion < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	belongs_to :canine
	belongs_to :category_race_variety
	self.per_page = 15
  	# validates
	validates :category_race_variety_id, presence: true
	validates :spectacle_id, presence: true
	validates :canine_id, presence: true
	validates :points, presence: true
	validates :position, presence: true
	
end
