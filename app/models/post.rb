class Post < ApplicationRecord
  validates :image, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  belongs_to :user
end
