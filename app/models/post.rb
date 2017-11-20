class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :image, presence: true
  validates_processing_of :image, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  has_many :comments, dependent: :destroy
end
