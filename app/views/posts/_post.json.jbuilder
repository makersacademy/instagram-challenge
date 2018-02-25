json.extract! post, :id, :image, :description, :created_at, :updated_at
json.url post_url(post, format: :json)
