class AddObservationsToCaninoCharacteristics < ActiveRecord::Migration
  def change
    add_column :canino_characteristics, :observations, :text
  end
end
