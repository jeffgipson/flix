json.extract! review, :id, :title, :review, :rating, :name, :username, :movie_id, :created_at, :updated_at
json.url review_url(review, format: :json)
