json.extract! photo, :id, :image, :description, :created_at, :updated_at
json.url photo_url(photo, format: :json)
