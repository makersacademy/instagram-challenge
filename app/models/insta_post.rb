class InstaPost < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 3 }
  # validates :image, presence: true
  mount_uploader :image, ImageUploader
end
