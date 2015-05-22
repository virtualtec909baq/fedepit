class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :image
      t.boolean :status
      t.string :link

      t.timestamps null: false
    end
  end
end
