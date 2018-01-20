json.extract! post, :id, :image, :desc, :created_at, :updated_at
json.url post_url(post, format: :json)
