json.extract! post, :id, :name, :title, :content, :picture, :created_at, :updated_at
json.url post_url(post, format: :json)
