class Post < ApplicationRecord

  has_many :comments

  has_attached_file :image, styles: { :medium => "300x" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
