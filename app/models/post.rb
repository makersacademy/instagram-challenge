class Post < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

end
