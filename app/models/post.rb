class Post < ApplicationRecord
  belongs_to :user

  def user_email
    User.find(user_id).email
  end
end
