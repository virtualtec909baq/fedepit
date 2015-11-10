class AddColorToCharacteristics < ActiveRecord::Migration
  def change
    add_column :characteristics, :color, :boolean
  end
end
