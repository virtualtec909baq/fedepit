class CreateCategoryRaceVarieties < ActiveRecord::Migration
  def change
    create_table :category_race_varieties do |t|
      t.integer :race_id
      t.integer :variety_id
      t.integer :category_id
      t.integer :tournament_id
      t.boolean :punctuation

      t.timestamps null: false
    end
  end
end
