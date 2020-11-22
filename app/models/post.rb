class Post < ApplicationRecord
  belongs_to :account
  validates :account_id, presence: true
  mount_uploader :image, ImageUploader
  
end
