class AddNameToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :breeder_name, :string
    add_column :features, :breeder_phone, :string
    add_column :features, :breeder_email, :string
    add_column :features, :canine_race, :string
    add_column :features, :canine_lof, :string
    add_column :features, :canine_birth, :string
    add_column :features, :canine_gender, :string
    add_column :features, :canine_color, :string
  end
end
