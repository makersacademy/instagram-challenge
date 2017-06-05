class Post < ApplicationRecord
  IMAGE_HEIGHT = 600
  belongs_to :user
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }

  validates :image, presence:true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
