class Like < ApplicationRecord
  belongs_to :user
  belongs_to :picture

  validates :user, uniqueness: { scope: :picture, message: "You liked this picture already" }

end
