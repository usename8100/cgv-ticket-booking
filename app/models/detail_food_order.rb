class DetailFoodOrder < ApplicationRecord
	belongs_to :booking_ticket
	belongs_to :foods
end
