class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image

  validates :user, uniqueness: { scope: :image, message: "You cannot like a image more than once" }
end
