class ChangeStringInCaninoCharacteristics < ActiveRecord::Migration
  def change
  	remove_column :canino_characteristics, :value, :string
  	add_column :canino_characteristics, :value, :integer
  end
end
