class Post < ApplicationRecord
  belongs_to :user
  validates :username, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
