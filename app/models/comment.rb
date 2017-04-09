class Comment < ActiveRecord::Base

  belongs_to :photo
  belongs_to :user

  def get_username
    User.find(self.user_id).username
  end

end
