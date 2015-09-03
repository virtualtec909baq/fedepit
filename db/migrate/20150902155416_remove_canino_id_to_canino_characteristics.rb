class RemoveCaninoIdToCaninoCharacteristics < ActiveRecord::Migration
  def change
    remove_column :canino_characteristics, :canino_id, :integer
    remove_column :canino_characteristics, :association_characteristic_id, :integer
    add_column :canino_characteristics, :canine_id, :integer
  end
end
