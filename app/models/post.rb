class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
