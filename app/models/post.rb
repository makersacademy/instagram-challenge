class Post < ApplicationRecord
  validates :picture, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }

  has_one_attached :picture

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
