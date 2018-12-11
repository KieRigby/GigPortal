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
    tickets = []
    errors = []
    @quantity = params[:quantity].to_i
    #Check quantity is in range
    if @quantity > 0 && @quantity < 6 then
      #for each quantity
      @quantity.times do |i|
        #try and save the ticket
        @ticket = Ticket.new(ticket_params)
        @ticket.event = @event
        @ticket.ticket_hash = SecureRandom.uuid
        if @ticket.save
          tickets.push(@ticket)
        else
          errors.push(@ticket.errors)
        end
      end
    else
      flash[:alert] = I18n.t('tickets.new.invalid-quantity')
      redirect_to new_event_ticket_path(@event)
    end


    #if there is an error then add it to the list of errors
    #if not then add the ticket to the array
    #respond

    respond_to do |format|
      if errors.empty?
        TicketMailer.send_tickets_email(tickets).deliver_now
        format.html { redirect_to @event, notice: I18n.t('tickets.new.tickets-sent') }
        format.json { render :show, status: :created, location: new_event_ticket_path }
      else
        format.html { render :new }
        format.json { render json: errors[0].errors, status: :unprocessable_entity }
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
