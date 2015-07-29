class AddHeadTipicityToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :typical_head, :integer
    add_column :features, :cheek, :integer
    add_column :features, :bite, :integer
    add_column :features, :deciduous, :integer
    add_column :features, :color, :string
  end
end
