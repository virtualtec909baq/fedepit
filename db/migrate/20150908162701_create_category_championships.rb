class CreateCategoryChampionships < ActiveRecord::Migration
  def change
    create_table :category_championships do |t|
      t.integer :race_id
      t.integer :age_min
      t.integer :age_max
      t.string :period
      t.integer :variety_id

      t.timestamps null: false
    end
  end
end
