class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  mount_uploader :photo, PhotoUploader

  validates :title, presence: true
  validates :photo, presence: true

  def author_username
    User.find(user_id).username
  end
end
