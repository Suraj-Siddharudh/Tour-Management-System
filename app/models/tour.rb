class Tour < ApplicationRecord
	belongs_to :user, optional: true 
	bas_many :bookings
end
