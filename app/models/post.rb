class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates_presence_of :title, :image
  acts_as_votable
  mount_uploader :image, PhotoUploader
end
