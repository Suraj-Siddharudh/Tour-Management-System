json.extract! booking, :id, :no_of_seats, :created_at, :updated_at
json.url booking_url(booking, format: :json)
