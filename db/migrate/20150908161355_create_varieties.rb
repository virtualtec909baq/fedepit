class CreateVarieties < ActiveRecord::Migration
  def change
    create_table :varieties do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
