class Post < ApplicationRecord

  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

# resizing the image to accept Instagram normal - 640px wide.
# validation set so that an image needs to be submitted in that form.
