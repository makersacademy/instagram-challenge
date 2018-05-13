class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  mount_uploader :picture, PictureUploader
end


