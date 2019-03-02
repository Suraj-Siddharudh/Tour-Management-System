json.extract! review, :id, :subject, :content, :user_id, :tour_id, :booking_id, :created_at, :updated_at
json.url review_url(review, format: :json)
