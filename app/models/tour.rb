class Tour < ApplicationRecord
	belongs_to :user, optional: true 
	before_create :set_available_seats
	
	has_many :bookings
	has_many :bookmark
	mount_uploader :image, ImageUploader
	serialize :image, JSON
	validate :image_size_validation
	

	validates_presence_of :Name, :pickup, :status, :countries, :states, :Description
	validates_numericality_of :total_seats, greater_than: 0, less_than_or_equal_to: 100, presence: true #avail_seats
	validates_numericality_of  :Price, greater_than: 0, less_than_or_equal_to: 300000
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :booking_deadline, presence: true
	validate :valid_end_date?


  def valid_end_date?
	  errors.add(:start_date, "must be before end_date") unless start_date < end_date
	end

# Image validation in image_uloader.rb
	def image_size_validation
		errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
	end

	private

	def set_available_seats
	  self.avail_seats = self.total_seats
	end
end
