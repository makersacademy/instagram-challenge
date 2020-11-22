class Post < ApplicationRecord
  # mount_uploader :image, ImageUploader
  # scope :active, -> { where active: true }
  belongs_to :account
  validates :user_id, presence: true
  
end
