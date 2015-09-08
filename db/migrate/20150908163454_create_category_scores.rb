class CreateCategoryScores < ActiveRecord::Migration
  def change
    create_table :category_scores do |t|
      t.integer :category_championship_id
      t.integer :score
      t.boolean :status

      t.timestamps null: false
    end
  end
end
