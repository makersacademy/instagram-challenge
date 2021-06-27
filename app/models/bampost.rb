class Bampost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :image, presence: true
  has_one_attached :image
end
