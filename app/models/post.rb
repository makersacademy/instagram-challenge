class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  def build_comment(attributes = {}, user)
   comment = comments.build(attributes)
   comment.user = user
   comment
 end

end
