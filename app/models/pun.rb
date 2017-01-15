class Pun < ApplicationRecord

  belongs_to :user
  validates :name, length: { minimum: 3 }, uniqueness: true

  def belongs_to_user?(user)
  self.user == user
  end

end
