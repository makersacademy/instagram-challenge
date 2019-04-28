

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
  # allows post.likes to be called
  mount_uploader :image, ImageUploader
  validate :image_presence
  # has_one_attached :image

  
  def image_presence
    errors[:image] << "should upload image" if image.size == 0.megabytes
  end 


end