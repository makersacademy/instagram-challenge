class Post::Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
