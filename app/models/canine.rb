class Canine < ActiveRecord::Base
	belongs_to :breeder
	belongs_to :race
end
