class Ticket < ApplicationRecord
  validates :ticket_hash, presence: true
  validates :ticket_hash, unique: true
  validates :event, presence: true
  validates :scanned, presence: true
  
  belongs_to :event
end
