class Instapost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  has_many :comments
  acts_as_votable
end

# @post = Instapost.new(:name => 'my post!')
# @post.save

# @post.liked_by @user
# @post.votes_for.size
