class Canine < ActiveRecord::Base
	after_initialize :init
	belongs_to :breeder
	belongs_to :race
	belongs_to :color
	has_many :images

	# default for will_paginate
	self.per_page = 15

	has_many :images
   	accepts_nested_attributes_for :images
	
	# validates
	validates_uniqueness_of :lof
	# validates :race_id, presence: true 
	# validates :breeder_id, presence: true 
	# validates :lof, presence: true 
	# validates :chip, presence: true 
	# validates :name, presence: true 
	# validates :gender, presence: true 
	# validates :color_id, presence: true 
	# validates :father_lof, presence: true 
	# validates :mother_lof, presence: true 
	# validates :rate, presence: true 
	# validates :birth, presence: true 
	# validates :death, presence: true 

	def init
		o = [('a'..'z'), ('1'..'9'), ('A'..'Z')].map { |i| i.to_a }.flatten
	  	string = (0...5).map { o[rand(o.length)] }.join
	  	val = string+Time.now.strftime('%H%S%L')
		self.lof  ||= val.upcase
	end
end
