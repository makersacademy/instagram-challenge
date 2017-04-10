class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  validates :user, uniqueness: { scope: :picture, message: "has liked this picture already" }
end
