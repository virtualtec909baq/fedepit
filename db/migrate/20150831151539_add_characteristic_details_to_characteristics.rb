class AddCharacteristicDetailsToCharacteristics < ActiveRecord::Migration
  def change
    add_column :characteristics, :characteristic_details_id, :integer
  end
end
