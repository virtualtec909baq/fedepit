class CharacteristicDetail < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	has_many :characteristics, :through => :association_characteristics
  	has_many :association_characteristics 
end
