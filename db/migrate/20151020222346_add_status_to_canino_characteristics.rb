class AddStatusToCaninoCharacteristics < ActiveRecord::Migration
  def change
    add_column :canino_characteristics, :status, :boolean
    add_column :canino_characteristics, :temporal_race, :string
    add_column :canino_characteristics, :temporal_variety, :string
    add_column :canino_characteristics, :temporal_lof, :string
    add_column :canino_characteristics, :temporal_birth, :string
    add_column :canino_characteristics, :temporal_color, :string
    add_column :canino_characteristics, :temporal_sex, :string
    add_column :canino_characteristics, :temporal_owner, :string
    add_column :canino_characteristics, :temporal_phone, :string
    add_column :canino_characteristics, :temporal_email, :string
  end
end
