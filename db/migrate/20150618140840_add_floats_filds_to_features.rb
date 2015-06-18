class AddFloatsFildsToFeatures < ActiveRecord::Migration
  def change
  	add_column :features,:skull_width, :float
  	add_column :features,:skull_high, :float
  	add_column :features,:skull_diameter, :float
  	add_column :features,:head_length, :float
  	add_column :features,:skull_length, :float
  	add_column :features,:muzzle_high, :float
  	add_column :features,:skull_percentage, :float
  	add_column :features,:muzzle_percentage, :float
  	add_column :features,:heah_high, :float
  	add_column :features,:muzzle_high_skull, :float
  	add_column :features,:muscular_general, :float
  	add_column :features,:muscular_masetero, :float
  	add_column :features,:muscle_parietale, :float
  	add_column :features,:body_long, :float
  	add_column :features,:body_raised, :float
  	add_column :features,:diamter_thorax, :float
  end
end
