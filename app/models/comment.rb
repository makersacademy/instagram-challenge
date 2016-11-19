class Comment < ApplicationRecord
  belongs_to :picture
  belongs_to :user
  validates :user, presence:true
  validates :picture, presence:true
  validates :body, presence:true
end
