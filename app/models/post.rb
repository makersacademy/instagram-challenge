class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  def user_username
    User.find(user_id).username
  end
end
