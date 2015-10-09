class Standard < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	belongs_to :standar_type
	belongs_to :gender

end
