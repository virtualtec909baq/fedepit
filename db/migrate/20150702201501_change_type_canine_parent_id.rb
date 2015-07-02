class ChangeTypeCanineParentId < ActiveRecord::Migration
  def change
  	change_column :canines, :parent_id, :string
  end
end
