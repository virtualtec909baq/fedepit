class AddTypeToCanines < ActiveRecord::Migration
  def change
    add_column :canines, :kind, :string
  end
end
