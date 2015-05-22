require 'test_helper'

class TypeBreedersControllerTest < ActionController::TestCase
  setup do
    @type_breeder = type_breeders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_breeders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_breeder" do
    assert_difference('TypeBreeder.count') do
      post :create, type_breeder: { name: @type_breeder.name }
    end

    assert_redirected_to type_breeder_path(assigns(:type_breeder))
  end

  test "should show type_breeder" do
    get :show, id: @type_breeder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_breeder
    assert_response :success
  end

  test "should update type_breeder" do
    patch :update, id: @type_breeder, type_breeder: { name: @type_breeder.name }
    assert_redirected_to type_breeder_path(assigns(:type_breeder))
  end

  test "should destroy type_breeder" do
    assert_difference('TypeBreeder.count', -1) do
      delete :destroy, id: @type_breeder
    end

    assert_redirected_to type_breeders_path
  end
end
