class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :likes, dependent: :destroy
end
