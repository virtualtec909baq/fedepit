class AssociationCharacteristic < ActiveRecord::Base
	belongs_to :characteristic_detail
	belongs_to :characteristic
end
