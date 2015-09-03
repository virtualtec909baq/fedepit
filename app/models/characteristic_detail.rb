class CharacteristicDetail < ActiveRecord::Base
	has_many :characteristics, :through => :association_characteristics
  	has_many :association_characteristics 
end
