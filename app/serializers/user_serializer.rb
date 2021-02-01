class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :slug, :profile_photo

  has_many :posts
end
