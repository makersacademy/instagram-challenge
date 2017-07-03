class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  def user_email
    User.find(user_id).email
  end
end
