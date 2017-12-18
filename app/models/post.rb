class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :text, presence: true,
            length: { maximum: 2200 }

  mount_uploader :image, ImageUploader
end
