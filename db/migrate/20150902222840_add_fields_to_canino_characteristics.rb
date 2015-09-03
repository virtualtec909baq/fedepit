class AddFieldsToCaninoCharacteristics < ActiveRecord::Migration
  def change
    add_column :canino_characteristics, :temporal_id, :integer, :limit => 8
    add_column :canino_characteristics, :temporal_canine_name, :string
  end
end
