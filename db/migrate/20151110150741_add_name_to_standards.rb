class AddNameToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :name, :string
  end
end
