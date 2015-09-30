class AddNewRegisterToCanines < ActiveRecord::Migration
  def change
  	add_column :canines, :new_register, :string
  end
end
