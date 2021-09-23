class BookingTicket < ApplicationRecord
  belongs_to :show
  has_many :seat_reserveds
  belongs_to :user
end
