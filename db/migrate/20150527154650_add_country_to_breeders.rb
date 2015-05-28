class AddCountryToBreeders < ActiveRecord::Migration
  def change
    add_column :breeders, :country, :string
  end
end
