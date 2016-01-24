class Comment < ActiveRecord::Base

  belongs_to :picture
  belongs_to :user

  def poster_name
    user = User.find(self.user_id)
    user.user_name
  end

end
