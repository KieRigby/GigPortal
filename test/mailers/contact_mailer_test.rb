require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should return contact email" do
    mail = ContactMailer.contact_email("kieran@kierigby.com","Kieran Rigby","07480944162","Test message")
    assert_equal ['info@gigportal.co.uk'], mail.to
    assert_equal ['info@gigportal.co.uk'], mail.from
  end

end
