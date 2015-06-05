json.array!(@features) do |feature|
  json.extract! feature, :id, :skull_width, :skull_high, :skull_diameter, :head_length, :skull_length, :muzzle_high, :skull_percentage, :muzzle_percentage, :muzzle_high, :heah_high, :muzzle_high_skull, :insertion_ear, :bite_pin, :bite_crusade_inside, :bite_prognato, :bite_enognato, :bite_fork_inverted, :bite_right, :dental_full, :dental_incisor, :dental_canine, :dental_molar, :dental_premolar, :muscular_general, :muscular_masetero, :muscle_parietale, :body_long, :body_raised, :diamter_thorax, :recommendation, :title_work, :test_strength, :test_dog_safe, :championsihp, :defects_bite, :lack_dental, :postponement, :entropion, :ectropion, :displacia_elbow, :displacia_hip, :problem_conduct, :defect_tail
  json.url feature_url(feature, format: :json)
end
