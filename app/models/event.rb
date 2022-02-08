class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :signups, foreign_key: 'attended_event'
  has_many :attendees, through: :signups
end
