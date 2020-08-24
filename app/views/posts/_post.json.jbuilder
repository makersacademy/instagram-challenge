json.extract! post, :id, :image, :username, :description, :location, :created_at, :updated_at
json.url post_url(post, format: :json)
