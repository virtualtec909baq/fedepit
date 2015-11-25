class Characteristic < ActiveRecord::Base
	acts_as_list
  	default_scope order('position')
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	has_many :standards
	has_many :canines, :through => :canino_characteristics
  	has_many :canino_characteristics   
  	has_many :characteristic_details, :through => :association_characteristics
  	has_many :association_characteristics 
	belongs_to :measure
	validates :name, presence: true , :on => :create
end
