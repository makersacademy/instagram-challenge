class Post < ApplicationRecord
  IMAGE_HEIGHT = 580
  has_attached_file :image,
  styles: { original: { convert_options: '-auto-orient' },
                           thumb: "100x100#",
                           large: "580x580>" }

  validates :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :likes
  belongs_to :user
  has_many :comments
end
