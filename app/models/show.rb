class Show < ApplicationRecord
  belongs_to :screen
  has_many :booking_tickets
  has_one :movie
end
