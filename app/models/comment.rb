class Comment < ActiveRecord::Base
  belongs_to :image
  belongs_to :user
  validates :comment, length: {minimum: 3}
end
