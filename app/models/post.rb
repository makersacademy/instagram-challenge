class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  def build_comment(attributes = {}, user)
   comment = comments.build(attributes)
   comment.user = user
   comment
 end

end
