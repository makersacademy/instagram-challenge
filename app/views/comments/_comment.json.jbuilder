json.extract! comment, :id, :user_id, :image_id, :comment, :created_at, :updated_at
json.url comment_url(comment, format: :json)
