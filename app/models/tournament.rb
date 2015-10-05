class Tournament < ActiveRecord::Base
  self.per_page = 10
  # validates
  validates :name, presence: true 
end
