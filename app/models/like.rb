class Like < ApplicationRecord

  belongs_to :user
  belongs_to :photo

  validates :user, uniqueness: { scope: :photo, message: "has liked this restaurant already" }

end
