class Post < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :body, presence: true, length: { minimum: 3 }
end
