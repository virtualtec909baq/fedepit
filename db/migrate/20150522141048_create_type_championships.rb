class CreateTypeChampionships < ActiveRecord::Migration
  def change
    create_table :type_championships do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
