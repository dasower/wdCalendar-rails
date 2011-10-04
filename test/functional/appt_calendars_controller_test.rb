require 'test_helper'

class ApptCalendarsControllerTest < ActionController::TestCase
  setup do
    @appt_calendar = appt_calendars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appt_calendars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appt_calendar" do
    assert_difference('ApptCalendar.count') do
      post :create, appt_calendar: @appt_calendar.attributes
    end

    assert_redirected_to appt_calendar_path(assigns(:appt_calendar))
  end

  test "should show appt_calendar" do
    get :show, id: @appt_calendar.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appt_calendar.to_param
    assert_response :success
  end

  test "should update appt_calendar" do
    put :update, id: @appt_calendar.to_param, appt_calendar: @appt_calendar.attributes
    assert_redirected_to appt_calendar_path(assigns(:appt_calendar))
  end

  test "should destroy appt_calendar" do
    assert_difference('ApptCalendar.count', -1) do
      delete :destroy, id: @appt_calendar.to_param
    end

    assert_redirected_to appt_calendars_path
  end
end
