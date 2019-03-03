class Post < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }
end
