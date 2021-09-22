class SeatReserved < ApplicationRecord
  belongs_to :booking_ticket
  belongs_to :cinema_seat
end
