require 'test_helper'

class TypeChampionshipsControllerTest < ActionController::TestCase
  setup do
    @type_championship = type_championships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_championships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_championship" do
    assert_difference('TypeChampionship.count') do
      post :create, type_championship: { name: @type_championship.name }
    end

    assert_redirected_to type_championship_path(assigns(:type_championship))
  end

  test "should show type_championship" do
    get :show, id: @type_championship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_championship
    assert_response :success
  end

  test "should update type_championship" do
    patch :update, id: @type_championship, type_championship: { name: @type_championship.name }
    assert_redirected_to type_championship_path(assigns(:type_championship))
  end

  test "should destroy type_championship" do
    assert_difference('TypeChampionship.count', -1) do
      delete :destroy, id: @type_championship
    end

    assert_redirected_to type_championships_path
  end
end
