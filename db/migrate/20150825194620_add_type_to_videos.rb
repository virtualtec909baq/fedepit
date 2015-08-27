class AddTypeToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :type_category_id, :integer
  end
end
