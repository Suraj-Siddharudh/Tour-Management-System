class Tour < ApplicationRecord
	belongs_to :user, optional: true 
	has_many :bookings
end
