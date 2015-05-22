class CreateBreeders < ActiveRecord::Migration
  def change
    create_table :breeders do |t|
      t.integer :type_breeder_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :name_breed
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :web

      t.timestamps null: false
    end
  end
end
