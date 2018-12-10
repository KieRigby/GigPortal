require 'rqrcode'

class TicketController < ApplicationController
  before_action :set_ticket, only: [:view]
  before_action :set_event, only: [:get]

  def view
    @qr = RQRCode::QRCode.new(@ticket.ticket_hash, :size => 5, :level => :h)
  end

  def get
  end

  def request_ticket
  end


  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def ticket_params
      params.require(:ticket).permit(:ticket_hash,:event,:scanned)
    end

end
