json.extract! review, :id, :place_id, :reviewer_id, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)
