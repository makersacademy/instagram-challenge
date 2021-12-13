class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { minimum: 10 }
  has_one_attached :image
  belongs_to :user
end
