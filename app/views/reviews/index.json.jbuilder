json.array!(@reviews) do |review|
  json.extract! review, :id, :review
  json.url review_url(review, format: :json)
end
