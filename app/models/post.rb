class Post < ApplicationRecord
  belongs_to :user
  def find_email
    user.email
  end
end
