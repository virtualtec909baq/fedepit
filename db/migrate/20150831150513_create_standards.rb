class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.integer :race_id
      t.integer :characteristic_id
      t.integer :gender_id
      t.integer :standar_type_id

      t.timestamps null: false
    end
  end
end
