class Comment < ActiveRecord::Base
  belongs_to :photo
  has_many :comment_likes
end
