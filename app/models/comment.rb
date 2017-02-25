class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  # validates :user, uniqueness: { scope: :image, message: "has commented on this image already" }
end
