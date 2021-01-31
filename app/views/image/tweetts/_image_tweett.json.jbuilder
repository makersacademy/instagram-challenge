json.extract! image_tweett, :id, :content, :image_id, :created_at, :updated_at
json.url image_tweett_url(image_tweett, format: :json)
