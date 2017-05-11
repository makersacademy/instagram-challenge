class Picture < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  def build_comment(comment_params, user)
    comment = user.comments.new(comment_params)
    comment.update(picture_id: self.id)
    comment
  end

end
