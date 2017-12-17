class InstaPost < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 3 }
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end
