class Event < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  # default for will_paginate
  self.per_page = 15
  # validates
  validates :name, presence: true 
  validates :description, presence: true 
  validates :date, presence: true 
  validates :place, presence: true 
  validates :type_event, presence: true 
  validates_length_of :description, :maximum => 200
  validates_length_of :description, :minimum => 50

  # relation
  belongs_to :type_event
  
	# img_uploader
	mount_uploader :img, EventUploader

	# search dates
	ransacker :date do
		Arel::Nodes::SqlLiteral.new("date(events.date)")
	end
end
