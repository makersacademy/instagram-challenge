json.extract! comment, :id, :content, :photo_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
