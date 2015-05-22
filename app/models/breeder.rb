class Breeder < ActiveRecord::Base
		belongs_to :type_breeder
		has_many :canines
end
