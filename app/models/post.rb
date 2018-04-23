class Post < ApplicationRecord
  validates :photo, presence: true
  validates :desc, presence: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def owner?(user)
    user.id.to_i == self.user_id.to_i
  end
end
