class Post < ApplicationRecord

  has_one_attached :picture
  has_many :comments

end
