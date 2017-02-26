class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user, uniqueness: { scope: :post, message: "You can only like a post once" }
  validate :own_post, :on => :create

  def own_post
    if post.user_id == user_id
      errors.add(:user_id, 'You cannot like your own post')
    end
  end
end
