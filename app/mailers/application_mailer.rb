class ApplicationMailer < ActionMailer::Base
  default to:'info@gigportal.co.uk', from: 'info@gigportal.co.uk'
  layout 'mailer'
end
