class AddAncestryToCanines < ActiveRecord::Migration
  def change
    add_column :canines, :lft, :integer, :index => true
    add_column :canines, :rgt, :integer, :index => true
    add_column :canines, :parent_id, :integer, :null => true, :index => true
  end
end
