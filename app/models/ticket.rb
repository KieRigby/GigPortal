class Ticket < ApplicationRecord
  #Validations
  validates :ticket_hash, presence: true
  validates :ticket_hash, uniqueness: true
  validates :event, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  #Relations
  belongs_to :event

  #Scopes
  scope :scanned, -> {where(scanned:true)}
  scope :unscanned, -> {where(scanned:false)}
  scope :events_ticket, -> (event) {where('event_id = ?',event.id)}
end
