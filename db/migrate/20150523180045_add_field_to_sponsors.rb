class AddFieldToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :name, :string
  end
end
