class Ticket < ApplicationRecord
  validates :ticket_hash, presence: true
  validates :ticket_hash, uniqueness: true
  validates :event, presence: true
  validates :scanned, presence: true

  belongs_to :event

  scope :scanned, -> {where(scanned:true)}
  scope :unscanned, -> {where(scanned:false)}
end
