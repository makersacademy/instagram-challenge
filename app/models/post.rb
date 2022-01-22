class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :pic
  validates :text, presence: true
end
