class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  mount_uploader :picture, PictureUploader


  def count_likes
   likes.count
 end

 def liked_by(current_user)
   likes.find_by(user_id: current_user)
   end

 def find_likes(current_user)
   likes.find_by(user_id: current_user)
 end
end
