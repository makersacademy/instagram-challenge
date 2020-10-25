class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  validate :image_presence

  def image_presence
    errors.add(:image, "add an image") unless image.attached?
  end
end
