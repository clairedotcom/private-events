class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :signups, foreign_key: 'attended_event', dependent: :destroy
  has_many :attendees, through: :signups

  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }
end
