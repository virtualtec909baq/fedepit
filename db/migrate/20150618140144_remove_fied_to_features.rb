class RemoveFiedToFeatures < ActiveRecord::Migration
  def change
  	remove_column :features,:skull_width, :float
  	remove_column :features,:skull_high, :float
  	remove_column :features,:skull_diameter, :float
  	remove_column :features,:head_length, :float
  	remove_column :features,:skull_length, :float
  	remove_column :features,:muzzle_high, :float
  	remove_column :features,:skull_percentage, :float
  	remove_column :features,:muzzle_percentage, :float
  	remove_column :features,:heah_high, :float
  	remove_column :features,:muzzle_high_skull, :float
  	remove_column :features,:muscular_general, :float
  	remove_column :features,:muscular_masetero, :float
  	remove_column :features,:muscle_parietale, :float
  	remove_column :features,:body_long, :float
  	remove_column :features,:body_raised, :float
  	remove_column :features,:diamter_thorax, :float
  end
end
