class AddPositionToCharacteristics < ActiveRecord::Migration
  def change
    add_column :characteristics, :position, :integer
    add_index :characteristics, [:position]
  end
end
