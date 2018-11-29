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
      flash[:alert] = L18N.t('home.contact.no-email')
    else
      flash[:notice] = L18N.t('home.contact.email-sent')
    end

    redirect_to contact_path
  end
end
