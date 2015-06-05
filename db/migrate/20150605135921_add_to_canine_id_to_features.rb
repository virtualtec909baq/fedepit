class AddToCanineIdToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :canine_id, :integer
  end
end
