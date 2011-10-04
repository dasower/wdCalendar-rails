require 'test_helper'

class JqcalendarsControllerTest < ActionController::TestCase
  setup do
    @jqcalendar = jqcalendars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jqcalendars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jqcalendar" do
    assert_difference('Jqcalendar.count') do
      post :create, jqcalendar: @jqcalendar.attributes
    end

    assert_redirected_to jqcalendar_path(assigns(:jqcalendar))
  end

  test "should show jqcalendar" do
    get :show, id: @jqcalendar.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jqcalendar.to_param
    assert_response :success
  end

  test "should update jqcalendar" do
    put :update, id: @jqcalendar.to_param, jqcalendar: @jqcalendar.attributes
    assert_redirected_to jqcalendar_path(assigns(:jqcalendar))
  end

  test "should destroy jqcalendar" do
    assert_difference('Jqcalendar.count', -1) do
      delete :destroy, id: @jqcalendar.to_param
    end

    assert_redirected_to jqcalendars_path
  end
end
