class CreateCharacteristicDetails < ActiveRecord::Migration
  def change
    create_table :characteristic_details do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
