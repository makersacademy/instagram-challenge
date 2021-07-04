json.extract! comment, :id, :user_name, :message, :photo_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
