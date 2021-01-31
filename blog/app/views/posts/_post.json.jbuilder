json.extract! post, :id, :title, :caption, :created_at, :updated_at
json.url post_url(post, format: :json)
