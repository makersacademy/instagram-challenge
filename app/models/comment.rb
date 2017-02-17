class Comment < ApplicationRecord
  validates :thoughts, presence: true

  belongs_to :user
  belongs_to :photo
end
