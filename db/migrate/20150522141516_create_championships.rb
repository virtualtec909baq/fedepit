class CreateChampionships < ActiveRecord::Migration
  def change
    create_table :championships do |t|
      t.integer :type_championship_id
      t.date :date

      t.timestamps null: false
    end
  end
end
