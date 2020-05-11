class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  validates :title, presence: true 
  validates :body, presence: true 
end
