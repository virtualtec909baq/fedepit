class Canine < ActiveRecord::Base
	
	belongs_to :breeder
	belongs_to :race
	belongs_to :color
	has_many :images
	has_one :feature

	has_many :events, :through => :canine_events
  	has_many :canine_events
  	
	# default for will_paginate
	self.per_page = 15

	has_many :images
   	accepts_nested_attributes_for :images
	
	# validates
	validates_uniqueness_of :lof
	validates :race_id, presence: true 
	validates :breeder_id, presence: true 
	validates :lof, presence: true 
	validates :name, presence: true 
	validates :gender, presence: true 
	validates :color_id, presence: true 
	validates :birth, presence: true 

end
