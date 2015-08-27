class Comment < ActiveRecord::Base
	after_initialize :init
	belongs_to :article

	self.per_page = 2
	
	def init
		self.report  ||= 0
  		self.status  ||= false
  	end
end
