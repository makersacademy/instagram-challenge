class Instagratification < ApplicationRecord
  belongs_to :picture
  belongs_to :user

  def belongs_to?(user)
    self.user == user
  end
end
