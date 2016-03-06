class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  def owned_by?(user)
    user == self.user
  end

end
