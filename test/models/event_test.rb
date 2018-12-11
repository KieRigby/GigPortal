require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @promoter = promoters(:one)
  end

  test "should not save empty event" do
    event = Event.new

    event.save
    refute event.valid?
  end

  test "should save valid event" do
    event = Event.new

    event.title = "Test Event"
    event.short_description = "This is a short description"
    event.long_description = "This is a long description"
    event.location_tbc = true
    event.date_tbc = true
    event.published = true
    event.promoter = @promoter

    event.save
    assert event.valid?
  end

  test "should not save untitled event" do
    event = Event.new

    event.short_description = "This is a short description"
    event.long_description = "This is a long description"
    event.location_tbc = true
    event.date_tbc = true
    event.published = true
    event.promoter = @promoter

    event.save
    refute event.valid?
  end

  test "should not save event without short description" do
    event = Event.new

    event.title = "Test Event"
    event.long_description = "This is a long description"
    event.location_tbc = true
    event.date_tbc = true
    event.published = true
    event.promoter = @promoter

    event.save
    refute event.valid?
  end

  test "should not save event without long description" do
    event = Event.new

    event.title = "Test Event"
    event.short_description = "This is a short description"
    event.location_tbc = true
    event.date_tbc = true
    event.published = true
    event.promoter = @promoter

    event.save
    refute event.valid?
  end

  test "should not save event without location if location not tbc" do
    event = Event.new

    event.title = "Test Event"
    event.short_description = "This is a short description"
    event.long_description = "This is a long description"
    event.location_tbc = false
    event.date_tbc = true
    event.published = true
    event.promoter = @promoter

    event.save
    refute event.valid?
  end

  test "should not save event with date in past" do
    event = Event.new

    event.title = "Test Event"
    event.short_description = "This is a short description"
    event.long_description = "This is a long description"
    event.location_tbc = true
    event.date = DateTime.now - 10.days
    event.date_tbc = true
    event.published = true
    event.promoter = @promoter

    event.save
    refute event.valid?
  end
end
