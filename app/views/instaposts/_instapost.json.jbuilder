json.extract! instapost, :id, :name, :description, :picture, :created_at, :updated_at
json.url instapost_url(instapost, format: :json)
