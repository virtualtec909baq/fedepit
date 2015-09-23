class Canine < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	belongs_to :breeder
	belongs_to :race
	has_many   :images
	has_many   :feature
	has_many :events, :through => :canine_events
  	has_many :canine_events

  	has_many :characteristics, :through => :canino_characteristics
  	has_many :canino_characteristics  
	self.per_page = 15

	has_many :images
   	accepts_nested_attributes_for :images
	
	# validates
	validates_uniqueness_of :lof
	validates :race_id, presence: true 
	validates :breeder_id, presence: true 
	validates :lof, presence: true 
	validates :name, presence: true 
	validates :kind, presence: true 
	validates :gender, presence: true 
	validates :birth, presence: true 
end
