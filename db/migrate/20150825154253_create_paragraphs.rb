class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.text :description
      t.string :img
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
