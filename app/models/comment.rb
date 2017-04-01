class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_presence_of :user
  validates_presence_of :content
  validates :content, length: { maximum: 140,
    too_long: "%{count} characters is the maximum allowed for a comment" }
end
