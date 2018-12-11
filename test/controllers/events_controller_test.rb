require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @event = events(:event_one)
    @promoter = promoters(:one)
    sign_in @promoter
  end

  test "should get index" do
    get events_url
    assert_select 'h1', 'Events'
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_select 'h1', 'Create an Event'
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_path, params: { event: { date: @event.date, date_tbc: @event.date_tbc, location: @event.location, location_tbc: @event.location_tbc, long_description: @event.long_description, published: @event.published, short_description: @event.short_description, title: @event.title } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { date: @event.date, date_tbc: @event.date_tbc, location: @event.location, location_tbc: @event.location_tbc, long_description: @event.long_description, published: @event.published, short_description: @event.short_description, title: @event.title } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
