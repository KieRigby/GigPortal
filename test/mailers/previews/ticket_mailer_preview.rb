# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview
  def send_tickets_email
    tickets = [];
    ticket1 = Ticket.new
    ticket1.first_name = "Kieran"
    ticket1.last_name = "Rigby"
    ticket1.email = "kieran@kierigby.com"
    ticket1.event_id = 2
    ticket1.ticket_hash = 'test-hash-1'

    ticket2 = Ticket.new
    ticket2.first_name = "Kieran"
    ticket2.last_name = "Rigby"
    ticket2.email = "kieran@kierigby.com"
    ticket2.event_id = 2
    ticket2.ticket_hash = 'test-hash-2'

    tickets.push(ticket1)
    tickets.push(ticket2)

    TicketMailer.send_tickets_email(tickets)
  end
end
