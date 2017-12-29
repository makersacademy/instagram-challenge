class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable

  validates :image, presence: true
  validates :caption, length: { minimum: 3, maximum: 500 }
end
