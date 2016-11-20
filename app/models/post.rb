class Post < ApplicationRecord
  has_many :comments
  validates :image_data, presence: true
end
