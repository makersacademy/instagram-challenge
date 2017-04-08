class Post < ActiveRecord::Base
  # validation for image input
  validates :image, presence: true
  # Next three lines are for Paperlip
  has_attached_file :image
  # Resizes image to 640px wide. Allows for taller images.
  has_attached_file :image, styles: { :medium => "640x" }
  # Validates that attachment is an image.
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
