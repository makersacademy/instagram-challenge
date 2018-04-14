class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  validates :message, presence: true
end
