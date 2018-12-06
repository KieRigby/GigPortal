class Event < ApplicationRecord
  validates :title, presence: true
  validates :short_description, presence: true
  validates :long_description, presence: true
  validates :published, presence: true

  scope :published, -> {where(published:true)}
end
