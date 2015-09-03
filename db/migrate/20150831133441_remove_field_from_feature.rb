class RemoveFieldFromFeature < ActiveRecord::Migration
  def change
  	drop_table :features
    
  end
end

