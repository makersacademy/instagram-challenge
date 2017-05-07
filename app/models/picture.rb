class Picture < ApplicationRecord
  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  belongs_to :user, dependent: :destroy

  validates :name, length: { minimum: 2 }, uniqueness: true

  def build_with_user(comment, user)
    comment = comments.build(comment)
    comment.user = user
    comment
  end
end
