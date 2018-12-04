# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    ContactMailer.contact_email("kieran@kierigby.com","Kieran Rigby","07480944162",@message = "Hello Worlds!")
  end

end
