class AddLipsToFeatures < ActiveRecord::Migration
  def change
  	add_column :features, :lips, :integer
  	add_column :features, :appearance, :integer
  	add_column :features, :length_chest, :integer
  end
end
