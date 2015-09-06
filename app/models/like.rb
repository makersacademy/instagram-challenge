class Like < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user

  def created_by_current_user?(user)
    if user
      self.user_id == user.id ? true : false
    else
      false
    end
  end
end
