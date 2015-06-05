class Comment < ActiveRecord::Base
	after_initialize :init

	belongs_to :article

	def init
  		self.status  ||= false
  	end
end
