class Image < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates_presence_of :photo
end
