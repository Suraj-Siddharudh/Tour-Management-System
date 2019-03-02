class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :tour

	validates_numericality_of :no_of_seats, greater_than: 0, less_than_or_equal_to: 100, presence: true
end
