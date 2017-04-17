class Like < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user

  validates :user, uniqueness: { scope: :picture, message: "has liked this picture already" }
end
