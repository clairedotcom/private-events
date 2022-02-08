class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :signups, foreign_key: 'attendee_id'
  has_many :attended_events, through: :signups
end
