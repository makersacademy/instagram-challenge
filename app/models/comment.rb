class Comment < ApplicationRecord

  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :commentable, polymorphic: true

  def owner_of_comment
    User.find(self.user_id)
  end

end
