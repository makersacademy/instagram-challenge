class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :description, length: { minimum: 2 }
end
