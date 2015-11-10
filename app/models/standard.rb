class Standard < ActiveRecord::Base
	include PublicActivity::Model
  include ApplicationHelper
	tracked owner: ->(controller, model) { controller && controller.current_user }
	before_save :concatenate_details
  belongs_to :race
	belongs_to :characteristic
	self.per_page = 15
  	# validates
	validates :description, presence: true 
	validates :age_gteq, presence: true
	validates :age_lt, presence: true
	validates :race_id, presence: true 
	validates :characteristic_id, presence: true
	validates :rg_lt, presence: true
	validates :rg_gteq, presence: true

  def concatenate_details
     self.name = "#{get_race(race_id)} #{description}"
  end

end
