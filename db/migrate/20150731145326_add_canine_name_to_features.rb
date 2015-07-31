class AddCanineNameToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :canine_name, :string
  end
end
