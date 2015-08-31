class Comment < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user

  def destroy_as(user)
    return false unless self.user == user
    destroy
    true
  end
end
