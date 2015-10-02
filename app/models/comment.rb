class Comment < ActiveRecord::Base
	after_create :init
	belongs_to :article
	
	# validates
	validates :message, presence: true
	validates :name_user, presence: true  
	validates_length_of :message, :maximum => 200
    validates_length_of :message, :minimum => 50

	self.per_page = 2
	
	def init
		self.report  ||= 0
  		self.status  ||= false
  	end
end
