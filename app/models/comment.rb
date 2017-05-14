class Comment < ApplicationRecord

  belongs_to :photo
  belongs_to :user
  delegate :email, to: :user
  delegate :username, to: :user

  validates :content, presence: true
end
