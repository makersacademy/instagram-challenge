class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  acts_as_votable

  validates :caption, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
