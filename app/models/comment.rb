class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  delegate :username, to: :user
  validates :content, presence: true
  validates :user, presence: true
  validates :picture, presence: true
end
