class Like < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user
  validates :picture, presence: true
  validates :user, presence: true
end
