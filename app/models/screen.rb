class Screen < ApplicationRecord
  has_many :cinema_seats
  has_many :shows
end
