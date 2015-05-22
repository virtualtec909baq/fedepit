require 'test_helper'

class TypeEventsControllerTest < ActionController::TestCase
  setup do
    @type_event = type_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_event" do
    assert_difference('TypeEvent.count') do
      post :create, type_event: { name: @type_event.name }
    end

    assert_redirected_to type_event_path(assigns(:type_event))
  end

  test "should show type_event" do
    get :show, id: @type_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_event
    assert_response :success
  end

  test "should update type_event" do
    patch :update, id: @type_event, type_event: { name: @type_event.name }
    assert_redirected_to type_event_path(assigns(:type_event))
  end

  test "should destroy type_event" do
    assert_difference('TypeEvent.count', -1) do
      delete :destroy, id: @type_event
    end

    assert_redirected_to type_events_path
  end
end
