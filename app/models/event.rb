class Event < ApplicationRecord
  validates :title, presence: true
  validates :short_description, presence: true
  validates :long_description, presence: true
  validate :event_date_cannot_be_in_past, on: :create
  validate :location_must_be_present_or_tbc, on: :create

  has_many :tickets, dependent: :destroy
  belongs_to :promoter

  scope :published, -> {where(published:true)}
  scope :future, -> {where("date > ?", DateTime.now)}
  scope :promoter_events, -> (promoter) {where('promoter_id = ?',promoter.id)}

  def event_date_cannot_be_in_past
    if date.present? && date < Date.today
     errors.add(:_date, "can't be in the past")
    end
  end

  def location_must_be_present_or_tbc
    if location_tbc == false && !location.present?
      errors.add(:_location, "must be set if the location is not TBC")
    end
  end

end
