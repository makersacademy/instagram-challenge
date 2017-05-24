class Like < ApplicationRecord

  belongs_to :photo
  belongs_to :user

  validates :user, uniqueness: { scope: :photo, message: "You've already liked this photo"}

end
