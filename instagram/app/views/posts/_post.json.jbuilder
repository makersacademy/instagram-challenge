json.extract! post, :id, :caption, :email, :created_at, :updated_at
json.url post_url(post, format: :json)
