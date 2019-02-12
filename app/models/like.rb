class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # def user
  #   @user = User.find(user_id)
  #   p @user
  #   @user.email
  # end
  def post_likes(post_id)
    Like.post_id(post_id).length
  end
end
