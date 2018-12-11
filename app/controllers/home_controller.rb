class HomeController < ApplicationController
  before_action :authenticate_promoter!, only: [:dashboard]

  def home
  end

  def dashboard
    @published = Event.published.future.promoter_events(current_promoter)
    @unpublished = Event.unpublished.future.promoter_events(current_promoter)
    @past = Event.past.promoter_events(current_promoter)
  end


  def contact
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if email.blank?
      flash[:alert] = I18n.t('home.contact.no-email')
    else
      ContactMailer.contact_email(email,name,telephone,message).deliver_now
      flash[:notice] = I18n.t('home.contact.email-sent')
    end

    redirect_to contact_path
  end
end
