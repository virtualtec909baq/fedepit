class Feature < ActiveRecord::Base
	belongs_to :canine
	validates :canine_name, presence: true 
end
