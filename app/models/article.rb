class Article < ActiveRecord::Base
	# default for will_paginate
  	self.per_page = 15
end
