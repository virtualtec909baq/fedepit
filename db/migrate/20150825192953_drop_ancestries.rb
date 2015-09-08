class DropAncestries < ActiveRecord::Migration
  def change
  		drop_table :brands
  		drop_table :canine_events
  end
end
