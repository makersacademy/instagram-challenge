class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :user_id, presence: true
end
