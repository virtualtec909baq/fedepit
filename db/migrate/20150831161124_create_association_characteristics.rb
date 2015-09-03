class CreateAssociationCharacteristics < ActiveRecord::Migration
  def change
    create_table :association_characteristics do |t|
      t.integer :characteristic_id
      t.integer :characteristic_detail_id

      t.timestamps null: false
    end
  end
end
