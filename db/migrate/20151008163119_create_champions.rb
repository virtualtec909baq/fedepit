class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
      t.integer :canine_id
      t.integer :category_race_variety_id
      t.integer :spectacle_id
      t.date :date
      t.float :points
      t.string :position

      t.timestamps null: false
    end
  end
end
