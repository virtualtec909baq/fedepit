class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.integer :measure_id
      t.string :name

      t.timestamps null: false
    end
  end
end
