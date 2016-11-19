class Like < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  validates :user, presence:true
  validates :picture, presence:true
end
