json.partial! "posts/post", post: @post
json.extract! @post, :id, :description, :image, :created_at, :updated_at
