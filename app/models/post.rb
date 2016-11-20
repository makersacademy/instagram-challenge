class Post < ApplicationRecord
  has_attached_file :image, default_url: '/images/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy

  def calculate_rating
    likes.size - dislikes.size
  end

  def update_rating
    update(rating: calculate_rating)
  end
end
