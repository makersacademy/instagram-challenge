class Gram < ApplicationRecord
  has_one_attached :image

  validates :body, presence: true
  validates :image, presence: true
end
