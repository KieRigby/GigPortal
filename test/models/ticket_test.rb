require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save empty ticket" do
    ticket = Ticket.new

    ticket.save
    refute ticket.valid?
  end

  test "should save valid ticket" do
    ticket = Ticket.new
    event = Event.new

    event.title = "Test Event"
    event.short_description = "This is a short description"
    event.long_description = "This is a long description"
    event.location_tbc = true
    event.date_tbc = true
    event.published = true

    ticket.ticket_hash = SecureRandom.uuid
    ticket.event = event
    ticket.scanned = false;
    ticket.first_name = "Kieran"
    ticket.last_name = "Rigby"
    ticket.email = "kieran@kierigby.com"

    ticket.save
    assert ticket.valid?
  end

  test "should not save ticket without hash" do
    ticket = Ticket.new
    event = Event.new

    event.title = "Test Event"
    event.short_description = "This is a short description"
    event.long_description = "This is a long description"
    event.location_tbc = true
    event.date_tbc = true
    event.published = true

    ticket.event = event
    ticket.scanned = false;
    ticket.first_name = "Kieran"
    ticket.last_name = "Rigby"
    ticket.email = "kieran@kierigby.com"

    ticket.save
    refute ticket.valid?
  end

  test "should not save ticket without event" do
    ticket = Ticket.new

    ticket.ticket_hash = SecureRandom.uuid
    ticket.scanned = false;
    ticket.first_name = "Kieran"
    ticket.last_name = "Rigby"
    ticket.email = "kieran@kierigby.com"

    ticket.save
    refute ticket.valid?
  end

  test "should not save ticket without first name" do
    ticket = Ticket.new
    event = Event.new

    event.title = "Test Event"
    event.short_description = "This is a short description"
    event.long_description = "This is a long description"
    event.location_tbc = true
    event.date_tbc = true
    event.published = true

    ticket.ticket_hash = SecureRandom.uuid
    ticket.event = event
    ticket.scanned = false;
    ticket.last_name = "Rigby"
    ticket.email = "kieran@kierigby.com"

    ticket.save
    refute ticket.valid?
  end

  test "should not save ticket without last name" do
    ticket = Ticket.new
    event = Event.new

    event.title = "Test Event"
    event.short_description = "This is a short description"
    event.long_description = "This is a long description"
    event.location_tbc = true
    event.date_tbc = true
    event.published = true

    ticket.ticket_hash = SecureRandom.uuid
    ticket.event = event
    ticket.scanned = false;
    ticket.first_name = "Kieran"
    ticket.email = "kieran@kierigby.com"

    ticket.save
    refute ticket.valid?
  end

  test "should not save ticket without email" do
    ticket = Ticket.new
    event = Event.new

    event.title = "Test Event"
    event.short_description = "This is a short description"
    event.long_description = "This is a long description"
    event.location_tbc = true
    event.date_tbc = true
    event.published = true

    ticket.ticket_hash = SecureRandom.uuid
    ticket.event = event
    ticket.scanned = false;
    ticket.first_name = "Kieran"
    ticket.last_name = "Rigby"

    ticket.save
    refute ticket.valid?
  end

  test "should not save ticket with existing hash" do
    hash = SecureRandom.uuid
    ticket1 = Ticket.new
    ticket2 = Ticket.new
    event = Event.new

    event.title = "Test Event"
    event.short_description = "This is a short description"
    event.long_description = "This is a long description"
    event.location_tbc = true
    event.date_tbc = true
    event.published = true

    ticket1.ticket_hash = hash
    ticket1.event = event
    ticket1.scanned = false;
    ticket1.first_name = "Kieran"
    ticket1.last_name = "Rigby"
    ticket1.email = "kieran@kierigby.com"

    ticket2.ticket_hash = hash
    ticket2.event = event
    ticket2.scanned = false;
    ticket2.first_name = "John"
    ticket2.last_name = "Smith"
    ticket2.email = "johnsmith@gmail.com"

    ticket1.save
    ticket2.save
    refute ticket2.valid?
  end

end
