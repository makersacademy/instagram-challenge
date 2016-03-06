class Comment < ActiveRecord::Base
  belongs_to :user
  delegate :username, to: :user
  belongs_to :post

  def owned_by?(user)
    self.user == user
  end
end
