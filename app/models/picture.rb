class Picture < ApplicationRecord
  has_one_attached :image

  # validates :image, presence: true # can add this in later
end
