class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def has_commented?(current_user)
    self.user == current_user
  end
end
