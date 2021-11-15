json.extract! post, :id, :caption, :has_attachment, :created_at, :updated_at
json.url post_url(post, format: :json)
