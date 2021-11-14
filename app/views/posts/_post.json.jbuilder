json.extract! post, :id, :title, :likes, :liked_by, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
