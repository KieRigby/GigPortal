require 'rqrcode'

class TicketMailer < ApplicationMailer
  default from: 'tickets@gigportal.co.uk'

  def send_tickets_email(tickets)
    @tickets = tickets
    @event = Event.find(tickets[0].event_id)
    @first_name = tickets[0].first_name
    @last_name =  tickets[0].last_name
    @email = tickets[0].email

    @hashes = []
    @qrs = []
    @tickets.each do |ticket|
      @hashes.push(ticket.ticket_hash)
      @qrs.push(RQRCode::QRCode.new( ticket.ticket_hash, :size => 5, :level => :h ))
    end

    mail(to: @email, subject: I18n.t('ticket_mailer.send_tickets_email.subject') + @event.title)
  end
end
