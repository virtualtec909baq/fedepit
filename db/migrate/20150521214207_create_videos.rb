class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :number_seen
      t.string :url

      t.timestamps null: false
    end
  end
end
