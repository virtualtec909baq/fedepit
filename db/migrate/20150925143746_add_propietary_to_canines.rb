class AddPropietaryToCanines < ActiveRecord::Migration
  def change
    add_column :canines, :propietary, :string
  end
end
