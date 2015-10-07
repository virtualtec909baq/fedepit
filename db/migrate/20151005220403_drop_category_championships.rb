class DropCategoryChampionships < ActiveRecord::Migration
  def change
  	drop_table :category_scores
  	drop_table :ranks
  	drop_table :scores
  	drop_table :shows
  	drop_table :videos
  end
end
