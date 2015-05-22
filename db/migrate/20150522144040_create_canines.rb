class CreateCanines < ActiveRecord::Migration
  def change
    create_table :canines do |t|
      t.integer :race_id
      t.integer :breeder_id
      t.string :lof
      t.string :chip
      t.string :name
      t.integer :gender
      t.integer :color_id
      t.string :father_lof
      t.string :mother_lof
      t.float :rate
      t.date :birth
      t.date :death

      t.timestamps null: false
    end
  end
end
