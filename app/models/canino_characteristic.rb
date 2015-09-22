class CaninoCharacteristic < ActiveRecord::Base
	belongs_to :canine
  	belongs_to :characteristic
end
