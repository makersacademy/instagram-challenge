class Comment < ActiveRecord::Base
  belongs_to :photo

  belongs_to :user

  def created_by?(user)
    self.user == user
  end
end
