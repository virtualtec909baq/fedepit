class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :taxonomic

      t.timestamps null: false
    end
  end
end
