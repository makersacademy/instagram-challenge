class Comment < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user

  validates :user, :picture, presence: true
end
