class CreateTypeCategories < ActiveRecord::Migration
  def change
    create_table :type_categories do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
