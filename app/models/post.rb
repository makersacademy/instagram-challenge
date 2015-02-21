class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  validates :description, length: { minimum: 2 }

  def created_by?(user)
    self.user == user
  end

end
