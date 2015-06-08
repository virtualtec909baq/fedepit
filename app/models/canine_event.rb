class CanineEvent < ActiveRecord::Base
	belongs_to :canine
  	belongs_to :event
end
