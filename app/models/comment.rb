class Comment < ApplicationRecord
  belongs_to :picture
  belongs_to :user

  validates :thoughts, presence: true
  def find_username(id)
    return User.find(id).username
  end

end
