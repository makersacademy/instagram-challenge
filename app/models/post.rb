class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :text, presence: true
  has_one_attached :pic
end
