json.extract! rating, :id, :user_id, :landlord_id, :overall, :repairs, :review, :created_at, :updated_at
json.url rating_url(rating, format: :json)
