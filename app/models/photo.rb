class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments

  include DateTimePresenter

  validates :image, presence: true

  acts_as_votable
end
