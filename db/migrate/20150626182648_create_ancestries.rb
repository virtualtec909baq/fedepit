class CreateAncestries < ActiveRecord::Migration
  def change
    create_table :ancestries do |t|
      t.integer :canine_id
      t.string :array_generation

      t.timestamps null: false
    end
  end
end
