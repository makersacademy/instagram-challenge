class Post < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true, blob: { content_type: :image }
end
