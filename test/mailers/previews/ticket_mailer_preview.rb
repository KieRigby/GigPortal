# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview
  def send_tickets_email
    TicketMailer.send_tickets_email("Kieran","Rigby",2,"test-hash","kieran@kierigby.com")
  end
end
