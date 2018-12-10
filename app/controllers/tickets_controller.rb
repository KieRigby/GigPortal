class TicketsController < ApplicationController
  before_action :set_event

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.ticket_hash = SecureRandom.uuid
    @ticket.event = @event

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to new_event_ticket_path, notice: 'Event was successfully created.' }
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

    def ticket_params
      params.require(:ticket).permit(:first_name, :last_name, :email, :event_id)
    end

end
