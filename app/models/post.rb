class Post < ApplicationRecord
  has_many :likes
  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x640#" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
