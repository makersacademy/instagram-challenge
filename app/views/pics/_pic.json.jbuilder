json.extract! pic, :id, :url, :description, :created_at, :updated_at
json.url pic_url(pic, format: :json)