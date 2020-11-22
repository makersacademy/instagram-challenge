class Post < ApplicationRecord
  #validates_presence_of :image
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, :dependent => :delete_all

  def like(user)
    likes << Like.new(user: user)
  end

  def unlike(user)
    likes.where(user_id: user.id).first.destroy
  end
end
