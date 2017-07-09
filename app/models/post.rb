class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :title, presence: true
  validates :photo, presence: true

  def user_username
    User.find(user_id).username
  end
end
