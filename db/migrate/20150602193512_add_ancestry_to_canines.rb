class AddAncestryToCanines < ActiveRecord::Migration
  def change
    add_column :canines, :ancestry, :string
    add_index :canines, :ancestry
  end
end
