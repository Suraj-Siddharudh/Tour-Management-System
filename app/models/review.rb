class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  belongs_to :booking
end
