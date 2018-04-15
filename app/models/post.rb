class Post < ApplicationRecord
  validates :photo, presence: true
  validates :desc, presence: true
  has_many :comments, dependent: :destroy
end
