class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def post_likes(id)
    Like.post_id(id).length
  end
end
