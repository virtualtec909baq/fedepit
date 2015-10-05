class CreateAnimations < ActiveRecord::Migration
  def change
    create_table :animations do |t|
      t.text :description
      t.string :title
      t.string :url
      t.integer :type_category_id

      t.timestamps null: false
    end
  end
end
