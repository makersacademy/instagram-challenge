json.extract! post, :id, :image, :caption, :user, :created_at, :updated_at
json.url post_url(post, format: :json)
