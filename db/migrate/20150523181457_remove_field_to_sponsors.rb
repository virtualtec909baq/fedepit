class RemoveFieldToSponsors < ActiveRecord::Migration
  def change
    remove_column :sponsors, :link, :string
  end
end
