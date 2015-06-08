class CreateCanineEvents < ActiveRecord::Migration
  def change
    create_table :canine_events do |t|
      t.integer :canine_id
      t.integer :event_id
      t.string :position
      t.string :reward

      t.timestamps null: false
    end
  end
end
