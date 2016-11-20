class Picture < ApplicationRecord
  belongs_to :user
  has_many :endorsements, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, PictureUploader
end
