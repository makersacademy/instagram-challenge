

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
  # allows post.likes to be called
  mount_uploader :image, ImageUploader
  validates_presence_of :image
  # has_one_attached :image




end