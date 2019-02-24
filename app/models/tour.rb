class Tour < ApplicationRecord
	belongs_to :user, optional: true 
	validates_presence_of :Name, :pickup, :status, :countries, :states, :Description
	validates_numericality_of :total_seats, :avail_seats, greater_than: 0, less_than_or_equal_to: 100, presence: true
	validates_numericality_of :avail_waitlist, :Price, greater_than: 0, presence: true
	
end
