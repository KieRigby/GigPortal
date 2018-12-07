require 'rqrcode'

class TicketController < ApplicationController
  before_action :set_ticket, only: [:view]

  def view
    @qr = RQRCode::QRCode.new(@ticket.ticket_hash, :size => 5, :level => :h)
  end


  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:ticket_hash,:event,:scanned)
    end

end
