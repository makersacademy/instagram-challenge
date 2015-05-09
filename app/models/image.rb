class Image < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

end
