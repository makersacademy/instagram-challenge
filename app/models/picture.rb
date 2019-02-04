class Picture < ApplicationRecord

  belongs_to :user
  acts_as_votable

  mount_uploader :image, ImageUploader
end
