class AddIndexCanineCharacteristic < ActiveRecord::Migration
  def change
  	add_reference :canines, :characteristics, index: true,  :unique => true
  end
end
