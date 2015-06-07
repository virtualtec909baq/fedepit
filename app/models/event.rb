class Event < ActiveRecord::Base
  # default for will_paginate
  self.per_page = 15
  # validates
  validates :name, presence: true 
  validates :description, presence: true 
  validates :date, presence: true 
  validates :place, presence: true 
  validates :type_event, presence: true 

    has_many :canines, :through => :canine_event
    has_many :canine_events

  # relation
  belongs_to :type_event
  
	# img_uploader
	mount_uploader :img, EventUploader

	# search dates
	ransacker :date do
		Arel::Nodes::SqlLiteral.new("date(events.date)")
	end
end
