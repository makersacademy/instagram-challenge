class Comment < ApplicationRecord

  belongs_to :photo
  belongs_to :user

  validates :content, presence: true
end
