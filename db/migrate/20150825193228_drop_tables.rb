class DropTables < ActiveRecord::Migration
  def change
  		drop_table :championships
  		drop_table :type_championships
  end
end
