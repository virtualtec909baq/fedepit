class AddValueToCaninoCharacteristics < ActiveRecord::Migration
  def change
    add_column :canino_characteristics, :value, :string
     add_column :canino_characteristics, :association_characteristic_id, :integer
    
  end
end
