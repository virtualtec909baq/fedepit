class AddNumToCharacteristics < ActiveRecord::Migration
  def change
    add_column :characteristics, :num, :boolean
  end
end
