class CreateTypeBreeders < ActiveRecord::Migration
  def change
    create_table :type_breeders do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
