class TypeCategory < ActiveRecord::Base
	validates :description, presence: true 
	has_many :animatios
end
