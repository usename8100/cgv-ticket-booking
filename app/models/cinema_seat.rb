class CinemaSeat < ApplicationRecord
  has_many :seat_reserveds
  belongs_to :screen
end
