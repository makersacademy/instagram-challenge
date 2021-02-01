class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image_url, :user_id
end
