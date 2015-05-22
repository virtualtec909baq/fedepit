class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :type_event_id
      t.string :name
      t.string :description
      t.date :date
      t.string :place

      t.timestamps null: false
    end
  end
end
