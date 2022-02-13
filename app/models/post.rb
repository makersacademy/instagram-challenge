class Post < ApplicationRecord
  has_one_attached :image

  validates :content, :image, :author, presence: { message: "is required" }
end
