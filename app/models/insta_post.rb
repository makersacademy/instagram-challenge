class InstaPost < ApplicationRecord
  has_many :comments
  validates :title, presence: true,
                    length: { minimum: 3 }
  # validates :image, presence: true
  mount_uploader :image, ImageUploader
end
