class Comment < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user

  def created_by?(user)
    self.user == user
  end

  def destroy_as(user)
    unless created_by? user
      errors.add(:user, 'cannot delete this comment')
      return
    end
    destroy
  end


end
