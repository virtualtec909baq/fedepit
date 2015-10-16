class Standard < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	belongs_to :race
	belongs_to :characteristic
	has_many :grades, :dependent => :destroy
    accepts_nested_attributes_for :grades, allow_destroy: true
end
