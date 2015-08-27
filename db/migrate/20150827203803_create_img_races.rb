class CreateImgRaces < ActiveRecord::Migration
  def change
    create_table :img_races do |t|
      t.integer :race_id
      t.string :img
      t.text :description

      t.timestamps null: false
    end
  end
end
