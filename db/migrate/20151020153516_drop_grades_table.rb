class DropGradesTable < ActiveRecord::Migration
  def change
  	drop_table :grades
  	drop_table :genders
  	drop_table :entities
  end
end
