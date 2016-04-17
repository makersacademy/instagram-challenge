class Comment < ActiveRecord::Base

  belongs_to :picture
  belongs_to :user

  def associate_with(current_user)
    self.user_id = current_user.id
    self.save
  end
end
