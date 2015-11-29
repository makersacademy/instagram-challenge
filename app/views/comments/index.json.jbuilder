json.array!(@comments) do |comment|
  json.extract! comment, :id, :body
  json.url comment_url(comment, format: :json)
end
