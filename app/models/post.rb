class Post < ActiveRecord::Base
  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :restrict_with_exception,
      dependent: :destroy
  has_many :likes,
      -> { extending WithUserAssociationExtension },
      dependent: :restrict_with_exception,
      dependent: :destroy
  belongs_to :user
  validates :title, length: { minimum: 3 }

  def has_posted?(current_user)
    self.user == current_user
  end

  def likes_count
    return 'No Likes' if likes.none?
    "Likes: #{likes.count}"
  end

  def has_been_liked?(current_user)
    like_by(current_user).length > 0
  end

  def like_by(current_user)
    (likes&current_user.likes)
  end
end
