class TypeCategory < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	validates :description, presence: true 
	has_many :animatios
end
