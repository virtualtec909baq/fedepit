class AddImgToBreeders < ActiveRecord::Migration
  def change
    add_column :breeders, :img, :string
  end
end
