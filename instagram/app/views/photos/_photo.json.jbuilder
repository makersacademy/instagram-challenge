json.extract! photo, :id, :name, :description, :picture, :created_at, :updated_at
json.url photo_url(photo, format: :json)
