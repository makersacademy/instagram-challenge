json.extract! post, :id, :message, :like_count, :created_at, :updated_at
json.url post_url(post, format: :json)
