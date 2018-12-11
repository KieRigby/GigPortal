require 'rqrcode'

class TicketsController < ApplicationController
  before_action :set_event, only: [:create,:new]
  #before_action :set_ticket, only: [:show]

  # A few routes which may come in handy in a future date for QR code tickets and user accounts
  # def show
  #   @qrcode = RQRCode::QRCode.new(@ticket.ticket_hash,:size => 5, :level => :h )
  # end
  #
  # def scan
  # end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.ticket_hash = SecureRandom.uuid
    @ticket.event = @event

    respond_to do |format|
      if @ticket.save
        TicketMailer.send_tickets_email(@ticket.first_name, @ticket.last_name, @ticket.event.id, @ticket.ticket_hash, @ticket.email).deliver_now
        format.html { redirect_to new_event_ticket_path, notice: I18n.t('tickets.new.tickets-sent') }
        format.json { render :show, status: :created, location: new_event_ticket_path }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:first_name, :last_name, :email, :event_id)
    end

end
