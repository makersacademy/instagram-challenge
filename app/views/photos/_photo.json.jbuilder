json.extract! photo, :id, :name, :description, :picture, :users_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
