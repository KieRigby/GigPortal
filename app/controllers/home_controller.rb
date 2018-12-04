class HomeController < ApplicationController
  def home
  end

  def contact
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if email.blank?
      flash[:danger] = I18n.t('home.contact.no-email')
    else
      ContactMailer.contact_email(email,name,telephone,message).deliver_now
      flash[:success] = I18n.t('home.contact.email-sent')
    end

    redirect_to contact_path
  end
end
