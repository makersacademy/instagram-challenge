class Post < ApplicationRecord
  has_one_attached :image
  has_many :post_likes

  validates :content, :image, :author, presence: { message: "is required" }
end
