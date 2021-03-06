class CaninoCharacteristic < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	belongs_to :canine
  	belongs_to :characteristic
end
