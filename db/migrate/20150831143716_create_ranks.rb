class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :description
      t.float :ri
      t.float :rs

      t.timestamps null: false
    end
  end
end
