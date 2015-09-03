class CreateCaninoCharacteristics < ActiveRecord::Migration
  def change
    create_table :canino_characteristics do |t|
      t.integer :canino_id
      t.integer :characteristic_id

      t.timestamps null: false
    end
  end
end
