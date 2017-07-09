class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :caption, presence: true
  validates :image, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
end
