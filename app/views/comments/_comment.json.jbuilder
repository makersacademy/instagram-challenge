json.extract! comment, :id, :text, :user_id, :picture_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
