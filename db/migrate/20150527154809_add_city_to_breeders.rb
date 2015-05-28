class AddCityToBreeders < ActiveRecord::Migration
  def change
    add_column :breeders, :city, :string
  end
end
