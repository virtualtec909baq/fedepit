class CreateStandarTypes < ActiveRecord::Migration
  def change
    create_table :standar_types do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
