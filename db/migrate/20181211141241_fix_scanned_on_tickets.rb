class FixScannedOnTickets < ActiveRecord::Migration[5.0]
  def change
    Ticket.all.each do |ticket|
      ticket.scanned = false
      ticket.save
    end

    change_column_null :tickets, :scanned, false
    change_column_default :tickets, :scanned, false

  end
end
