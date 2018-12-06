class AddIndexToTickets < ActiveRecord::Migration[5.0]
  def change
    add_index :tickets, :ticket_hash, unique: true
  end
end
