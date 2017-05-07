class Turtlegram < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  # has_many :comments, dependent: :destroy

  has_many :comments,
  -> { extending WithUserAssociationExtension },
  dependent: :destroy
end
