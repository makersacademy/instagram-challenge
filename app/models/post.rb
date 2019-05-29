class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes

  validates :user_id, presence: true
  validates :image, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end

# resizing the image to accept Instagram normal - 640px wide.
# validation set so that an image needs to be submitted in that form.


# Used paperclip gem for images: remember to run 'bin/rails g paperclip post image' after installing paperclip 
