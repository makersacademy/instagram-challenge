class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :description, presence: true
  validates :user_id, presence: true
end
