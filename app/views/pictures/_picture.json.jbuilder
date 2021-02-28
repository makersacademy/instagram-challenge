json.extract! picture, :id, :caption, :likes, :comments, :created_at, :updated_at
json.url picture_url(picture, format: :json)
