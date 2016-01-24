json.array!(@posts) do |post|
  json.extract! post, :id, :title, :image, :description
  json.url post_url(post, format: :json)
end
