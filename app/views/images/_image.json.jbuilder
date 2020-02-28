json.extract! image, :id, :caption, :imageurl, :created_at, :updated_at
json.url image_url(image, format: :json)
