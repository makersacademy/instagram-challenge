class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
  #validates_presence_of :image_data 
 
  belongs_to :user
  has_many :likes
  has_many :comments
end
