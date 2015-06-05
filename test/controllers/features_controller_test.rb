require 'test_helper'

class FeaturesControllerTest < ActionController::TestCase
  setup do
    @feature = features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feature" do
    assert_difference('Feature.count') do
      post :create, feature: { bite_crusade_inside: @feature.bite_crusade_inside, bite_enognato: @feature.bite_enognato, bite_fork_inverted: @feature.bite_fork_inverted, bite_pin: @feature.bite_pin, bite_prognato: @feature.bite_prognato, bite_right: @feature.bite_right, body_long: @feature.body_long, body_raised: @feature.body_raised, championsihp: @feature.championsihp, defect_tail: @feature.defect_tail, defects_bite: @feature.defects_bite, dental_canine: @feature.dental_canine, dental_full: @feature.dental_full, dental_incisor: @feature.dental_incisor, dental_molar: @feature.dental_molar, dental_premolar: @feature.dental_premolar, diamter_thorax: @feature.diamter_thorax, displacia_elbow: @feature.displacia_elbow, displacia_hip: @feature.displacia_hip, ectropion: @feature.ectropion, entropion: @feature.entropion, head_length: @feature.head_length, heah_high: @feature.heah_high, insertion_ear: @feature.insertion_ear, lack_dental: @feature.lack_dental, muscle_parietale: @feature.muscle_parietale, muscular_general: @feature.muscular_general, muscular_masetero: @feature.muscular_masetero, muzzle_high: @feature.muzzle_high, muzzle_high: @feature.muzzle_high, muzzle_high_skull: @feature.muzzle_high_skull, muzzle_percentage: @feature.muzzle_percentage, postponement: @feature.postponement, problem_conduct: @feature.problem_conduct, recommendation: @feature.recommendation, skull_diameter: @feature.skull_diameter, skull_high: @feature.skull_high, skull_length: @feature.skull_length, skull_percentage: @feature.skull_percentage, skull_width: @feature.skull_width, test_dog_safe: @feature.test_dog_safe, test_strength: @feature.test_strength, title_work: @feature.title_work }
    end

    assert_redirected_to feature_path(assigns(:feature))
  end

  test "should show feature" do
    get :show, id: @feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feature
    assert_response :success
  end

  test "should update feature" do
    patch :update, id: @feature, feature: { bite_crusade_inside: @feature.bite_crusade_inside, bite_enognato: @feature.bite_enognato, bite_fork_inverted: @feature.bite_fork_inverted, bite_pin: @feature.bite_pin, bite_prognato: @feature.bite_prognato, bite_right: @feature.bite_right, body_long: @feature.body_long, body_raised: @feature.body_raised, championsihp: @feature.championsihp, defect_tail: @feature.defect_tail, defects_bite: @feature.defects_bite, dental_canine: @feature.dental_canine, dental_full: @feature.dental_full, dental_incisor: @feature.dental_incisor, dental_molar: @feature.dental_molar, dental_premolar: @feature.dental_premolar, diamter_thorax: @feature.diamter_thorax, displacia_elbow: @feature.displacia_elbow, displacia_hip: @feature.displacia_hip, ectropion: @feature.ectropion, entropion: @feature.entropion, head_length: @feature.head_length, heah_high: @feature.heah_high, insertion_ear: @feature.insertion_ear, lack_dental: @feature.lack_dental, muscle_parietale: @feature.muscle_parietale, muscular_general: @feature.muscular_general, muscular_masetero: @feature.muscular_masetero, muzzle_high: @feature.muzzle_high, muzzle_high: @feature.muzzle_high, muzzle_high_skull: @feature.muzzle_high_skull, muzzle_percentage: @feature.muzzle_percentage, postponement: @feature.postponement, problem_conduct: @feature.problem_conduct, recommendation: @feature.recommendation, skull_diameter: @feature.skull_diameter, skull_high: @feature.skull_high, skull_length: @feature.skull_length, skull_percentage: @feature.skull_percentage, skull_width: @feature.skull_width, test_dog_safe: @feature.test_dog_safe, test_strength: @feature.test_strength, title_work: @feature.title_work }
    assert_redirected_to feature_path(assigns(:feature))
  end

  test "should destroy feature" do
    assert_difference('Feature.count', -1) do
      delete :destroy, id: @feature
    end

    assert_redirected_to features_path
  end
end
