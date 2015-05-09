class Image < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :likes
  belongs_to :user
end
