class Post < ApplicationRecord 
  mount_uploader :image, ImageUploader
  belongs_to :account
  has_many :comments
end
