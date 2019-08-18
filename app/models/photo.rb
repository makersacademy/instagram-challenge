class Photo < ApplicationRecord

  has_many :comments
  has_many :likes

  validates :image, presence: true
  validates :caption, presence: true, length: { maximum: 100 }

  has_one_attached :image unless :image == nil
end
