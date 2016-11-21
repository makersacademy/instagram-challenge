class Comment < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user
  validates :picture, presence: true
  validates :user, presence: true
  validates :words, length: { maximum: 1500 }
end
