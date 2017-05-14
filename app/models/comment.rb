class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  validates :opinion, presence: true
end
