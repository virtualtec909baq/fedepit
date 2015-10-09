class Canine < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	scope :without, -> { where("lft IS NOT ? OR rgt IS NOT ?", nil, nil)}
	
	belongs_to :breeder
	belongs_to :race
	has_many   :images
	
  	has_many :characteristics, :through => :canino_characteristics
  	has_many :canino_characteristics 

  	has_many :category_race_varieties, :through => :champions
  	has_many :champions 

	self.per_page = 15

	has_many :images, :dependent => :destroy
   	accepts_nested_attributes_for :images, allow_destroy: true
	
	# validates
	validates_uniqueness_of :lof
	validates :race_id, presence: true 
	validates :breeder_id, presence: true 
	validates :lof, presence: true 
	validates :name, presence: true 
	validates :kind, presence: true 
	validates :gender, presence: true 
end
