class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user

  def self.comment_author(comment_user_id)
    comment_author = User.find(comment_user_id)
    return comment_author.email
  end
end
