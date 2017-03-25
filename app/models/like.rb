class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image
  validates :user, uniqueness: { scope: :image, message: "has liked this image already" }
end
