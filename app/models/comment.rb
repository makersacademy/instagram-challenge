class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def author_username
    User.find(user_id).username
  end
end
