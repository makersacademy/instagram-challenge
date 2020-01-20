class Post < ApplicationRecord
  has_one_attached :image
  validate :image_presence
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
