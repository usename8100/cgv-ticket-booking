class CinemaSeat < ApplicationRecord
  has_many :seat_reserveds
  has_many :booking_tickets, through: :seat_reserveds
  belongs_to :screen
end
