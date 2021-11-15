class Post < ApplicationRecord

  # This is Post model which maps to a posts table in the DB
  belongs_to :user

  has_one_attached :image
  # 1:1, one post has one image

  validate :image_presence
  
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
  
end
