class Tour < ApplicationRecord
	belongs_to :user, optional: true 
	before_create :set_available_seats
	
	validates_presence_of :Name, :pickup, :status, :countries, :states, :Description
	validates_numericality_of :total_seats, greater_than: 0, less_than_or_equal_to: 100, presence: true #avail_seats
	validates_numericality_of  :Price, greater_than: 0, less_than_or_equal_to: 300000
	#Removing validation on avail seats and waitlist
	has_many :bookings
	mount_uploader :image, ImageUploader
	serialize :image, JSON

	private

	def set_available_seats
	  self.avail_seats = self.total_seats
	end
end
