class BookingTicket < ApplicationRecord
  belongs_to :show
  has_many :seat_reserveds
  has_many :cinema_seats, through: :seat_reserveds
  belongs_to :user
end
