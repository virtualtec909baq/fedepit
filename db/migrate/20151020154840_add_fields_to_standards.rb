class AddFieldsToStandards < ActiveRecord::Migration
  def change
    add_column :standards, :rg_lt, :float
    add_column :standards, :rg_gteq, :float
    add_column :standards, :age_lt, :integer
    add_column :standards, :age_gteq, :integer
    add_column :standards, :description, :string
    remove_column :standards, :gender_id, :integer
  end
end
