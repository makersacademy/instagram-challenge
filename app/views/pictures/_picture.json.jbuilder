json.extract! picture, :id, :image_url, :user_id, :created_at, :updated_at
json.url picture_url(picture, format: :json)
