class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :name_user
      t.string :email_user
      t.string :message
      t.integer :report
      t.boolean :status

      t.timestamps null: false
    end
  end
end
