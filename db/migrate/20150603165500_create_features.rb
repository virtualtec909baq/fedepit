class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.float :skull_width
      t.float :skull_high
      t.float :skull_diameter
      t.float :head_length
      t.float :skull_length
      t.float :muzzle_high
      t.float :skull_percentage
      t.float :muzzle_percentage
      t.float :muzzle_high
      t.float :heah_high
      t.float :muzzle_high_skull
      t.string :insertion_ear
      t.boolean :bite_pin
      t.boolean :bite_crusade_inside
      t.boolean :bite_prognato
      t.boolean :bite_enognato
      t.boolean :bite_fork_inverted
      t.boolean :bite_right
      t.boolean :dental_full
      t.boolean :dental_incisor
      t.boolean :dental_canine
      t.boolean :dental_molar
      t.boolean :dental_premolar
      t.float :muscular_general
      t.float :muscular_masetero
      t.float :muscle_parietale
      t.float :body_long
      t.float :body_raised
      t.float :diamter_thorax
      t.boolean :recommendation
      t.boolean :title_work
      t.boolean :test_strength
      t.boolean :test_dog_safe
      t.boolean :championsihp
      t.boolean :defects_bite
      t.boolean :lack_dental
      t.boolean :postponement
      t.boolean :entropion
      t.boolean :ectropion
      t.boolean :displacia_elbow
      t.boolean :displacia_hip
      t.boolean :problem_conduct
      t.boolean :defect_tail

      t.timestamps null: false
    end
  end
end
