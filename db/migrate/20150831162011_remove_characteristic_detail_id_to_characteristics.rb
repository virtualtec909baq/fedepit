class RemoveCharacteristicDetailIdToCharacteristics < ActiveRecord::Migration
  def change
  	remove_column :characteristics, :characteristic_details_id, :integer
  end
end
