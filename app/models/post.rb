class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :pic
  has_many :comments
  validates :text, presence: true
end
