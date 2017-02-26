class Comment < ApplicationRecord
  belongs_to :picture
  belongs_to :user

  def find_username(id)
    return User.find(id).username
  end

end
