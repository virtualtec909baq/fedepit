class AddAdrressToBreeders < ActiveRecord::Migration
  def change
    add_column :breeders, :adrress, :string
  end
end
