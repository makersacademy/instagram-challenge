class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :image

  def set_user!(user)
    self.user_id = user.id
    self.save!
  end

end
