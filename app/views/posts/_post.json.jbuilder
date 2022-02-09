json.extract! post, :id, :image_url, :caption, :created_at, :updated_at
json.url post_url(post, format: :json)
