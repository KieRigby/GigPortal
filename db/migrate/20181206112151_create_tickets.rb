class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :ticket_hash, null: false
      t.belongs_to :event, foreign_key: true
      t.boolean :scanned, null: false, default:false

      t.timestamps
    end
  end
end
