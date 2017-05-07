class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  def upvote
    if self.likes
      self.likes += 1
    else
      self.likes = 0
    end
  end
end
