class AddChampionshipToTypeEvents < ActiveRecord::Migration
  def change
    add_column :type_events, :championship, :boolean
  end
end
