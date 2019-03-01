class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :tour

	validates :no_of_seats, presence: true
end
