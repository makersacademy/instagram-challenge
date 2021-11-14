class Post < ApplicationRecord
  has_one_attached :images
  has_many :comments
  belongs_to :user
  validates :images, attached: true,
                     content_type: ['image/png', 'image/jpg'],
                     size: { less_than: 10.megabytes, message: 'is too big' }
end
