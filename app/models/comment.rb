class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  def author
    user.username
  end

end
