class Pic < ApplicationRecord
  mount_uploader :url, PictureUploader
  validates :url, presence: true
  has_many :comments, dependent: :destroy
end
