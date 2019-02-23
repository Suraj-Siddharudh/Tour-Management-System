class Tour < ApplicationRecord
	belongs_to :user, optional: true 
end
