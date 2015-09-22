class Characteristic < ActiveRecord::Base
	has_many :canines, :through => :canino_characteristics
  	has_many :canino_characteristics   
  	has_many :characteristic_details, :through => :association_characteristics
  	has_many :association_characteristics 
	belongs_to :measure
end
