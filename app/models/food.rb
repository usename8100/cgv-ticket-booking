class Food < ApplicationRecord
  has_many :detail_food_orders
  has_many :booking_tickets, through: :detail_food_orders
end
