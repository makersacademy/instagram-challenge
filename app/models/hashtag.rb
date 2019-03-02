class Hashtag < ApplicationRecord
  has_many :post_to_hashtags
  has_many :posts, through: :post_to_hashtags
end
