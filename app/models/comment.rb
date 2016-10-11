class Comment < ApplicationRecord

  belongs_to :picture
  belongs_to :user

  validates :comment, presence: true

end
