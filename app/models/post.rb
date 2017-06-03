class Post < ApplicationRecord
  IMAGE_HEIGHT = 540
  has_attached_file :image, styles: { :medium => "640x" }

  validates :image, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :likes
  belongs_to :user
  has_many :comments
end
