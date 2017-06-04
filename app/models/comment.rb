class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user

  validates :body, presence: true
end
