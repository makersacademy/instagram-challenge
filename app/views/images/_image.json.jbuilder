json.extract! image, :id, :description, :user_id, :photo, :created_at, :updated_at
json.url image_url(image, format: :json)
