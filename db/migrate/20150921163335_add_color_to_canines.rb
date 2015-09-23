class AddColorToCanines < ActiveRecord::Migration
  def change
    add_column :canines, :color, :string
  end
end
