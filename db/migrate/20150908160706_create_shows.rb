class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.integer :entity_id
      t.string :place
      t.string :name
      t.date :date

      t.timestamps null: false
    end
  end
end
