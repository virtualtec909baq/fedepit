class CreatePublicities < ActiveRecord::Migration
  def change
    create_table :publicities do |t|
      t.string :image
      t.string :name
      t.boolean :status

      t.timestamps null: false
    end
  end
end
