require 'test_helper'

class CaninesControllerTest < ActionController::TestCase
  setup do
    @canine = canines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:canines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create canine" do
    assert_difference('Canine.count') do
      post :create, canine: { birth: @canine.birth, breeder_id: @canine.breeder_id, chip: @canine.chip, color_id: @canine.color_id, death: @canine.death, father_lof: @canine.father_lof, gender: @canine.gender, lof: @canine.lof, mother_lof: @canine.mother_lof, name: @canine.name, race_id: @canine.race_id, rate: @canine.rate }
    end

    assert_redirected_to canine_path(assigns(:canine))
  end

  test "should show canine" do
    get :show, id: @canine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @canine
    assert_response :success
  end

  test "should update canine" do
    patch :update, id: @canine, canine: { birth: @canine.birth, breeder_id: @canine.breeder_id, chip: @canine.chip, color_id: @canine.color_id, death: @canine.death, father_lof: @canine.father_lof, gender: @canine.gender, lof: @canine.lof, mother_lof: @canine.mother_lof, name: @canine.name, race_id: @canine.race_id, rate: @canine.rate }
    assert_redirected_to canine_path(assigns(:canine))
  end

  test "should destroy canine" do
    assert_difference('Canine.count', -1) do
      delete :destroy, id: @canine
    end

    assert_redirected_to canines_path
  end
end
