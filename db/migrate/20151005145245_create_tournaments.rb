class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
