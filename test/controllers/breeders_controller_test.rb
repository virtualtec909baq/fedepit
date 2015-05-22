require 'test_helper'

class BreedersControllerTest < ActionController::TestCase
  setup do
    @breeder = breeders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:breeders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create breeder" do
    assert_difference('Breeder.count') do
      post :create, breeder: { email: @breeder.email, facebook: @breeder.facebook, instagram: @breeder.instagram, name: @breeder.name, name_breed: @breeder.name_breed, phone: @breeder.phone, twitter: @breeder.twitter, type_breeder_id: @breeder.type_breeder_id, web: @breeder.web }
    end

    assert_redirected_to breeder_path(assigns(:breeder))
  end

  test "should show breeder" do
    get :show, id: @breeder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @breeder
    assert_response :success
  end

  test "should update breeder" do
    patch :update, id: @breeder, breeder: { email: @breeder.email, facebook: @breeder.facebook, instagram: @breeder.instagram, name: @breeder.name, name_breed: @breeder.name_breed, phone: @breeder.phone, twitter: @breeder.twitter, type_breeder_id: @breeder.type_breeder_id, web: @breeder.web }
    assert_redirected_to breeder_path(assigns(:breeder))
  end

  test "should destroy breeder" do
    assert_difference('Breeder.count', -1) do
      delete :destroy, id: @breeder
    end

    assert_redirected_to breeders_path
  end
end
