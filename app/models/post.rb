class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validate :image_presence

  def image_presence
    errors.add(:image, "Post must have an image!") unless image.attached?
  end
end
