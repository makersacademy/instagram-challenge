class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, length: {minimum: 5}

  def build_comment(params, user)
    comment = comments.build(params)
    comment.user = user
    comment
  end

end
