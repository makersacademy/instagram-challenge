class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  validates :picture, presence: true
  validates :user,
    uniqueness: { scope: :picture, message: "has liked this picture already" },
    presence: true
end
