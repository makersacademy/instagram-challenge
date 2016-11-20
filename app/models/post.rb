class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :image_data, presence: true
end
