class Picture < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true, length: { minimum: 5 }
end
