class AddWinnerToChampions < ActiveRecord::Migration
  def change
    add_column :champions, :winner, :string
  end
end
