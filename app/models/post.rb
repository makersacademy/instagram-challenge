class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validate :image_presence

  def show
    @posts = current_user.posts.order(created_at: :desc)
  end

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
