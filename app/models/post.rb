class Post < ApplicationRecord
  before_destroy :destroy_likes_and_comments
  
  belongs_to :user
  has_many :likes
  has_many :comments
  mount_uploader :photo, PhotoUploader

  def destroy_likes_and_comments
    self.likes.destroy_all  
    self.comments.destroy_all 
  end
end
