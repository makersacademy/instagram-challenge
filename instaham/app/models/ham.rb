class Ham < ApplicationRecord
  attr_accessor :image
  mount_uploader :image, ImageUploader
  belongs_to :user
end
