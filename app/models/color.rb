class Color < ActiveRecord::Base
	# default for will_paginate
	self.per_page = 15
	# validates
	validates :name, presence: true
end
