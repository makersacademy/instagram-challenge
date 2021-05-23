class Post < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  belongs_to :user
  validates :user_id, presence: true
end
