require 'rqrcode'

class TicketMailer < ApplicationMailer
  default from: 'tickets@gigportal.co.uk'

  def send_tickets_email(first_name, last_name, event_id, ticket_hash, email)
    @event = Event.find(event_id)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @ticket_hash = ticket_hash
    @qr = RQRCode::QRCode.new( @ticket_hash, :size => 4, :level => :h )

    mail(to: @email, subject: "Your tickets to #{ @event.title }!")
  end
end
