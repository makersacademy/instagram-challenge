class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: {
    minimum: 10  }
    has_one_attached :image
end
