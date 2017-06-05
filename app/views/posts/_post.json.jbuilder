json.extract! post, :id, :title, :body, :attachment
json.url post_url(post, format: :json)
