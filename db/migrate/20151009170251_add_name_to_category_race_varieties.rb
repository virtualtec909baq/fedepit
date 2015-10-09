class AddNameToCategoryRaceVarieties < ActiveRecord::Migration
  def change
    add_column :category_race_varieties, :name, :string
  end
end
