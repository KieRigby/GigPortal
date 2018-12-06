class TicketController < ApplicationController
  before_action :set_ticket, only: [:view]


  def view
    
  end


  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:ticket_hash,:event,:scanned)
    end

end
