class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :picture

  validates :text, presence: true
end
