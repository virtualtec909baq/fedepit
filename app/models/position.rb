class Position < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	# validate
	validates :place, presence: true
	validates_uniqueness_of :place
end
