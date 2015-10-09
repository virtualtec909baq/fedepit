class Tournament < ActiveRecord::Base
  include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
  self.per_page = 10
  # validates
  validates :name, presence: true 
end
