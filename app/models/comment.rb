class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :travelgram

  validates :user, uniqueness: { scope: :travelgram, message: "has commented on this adventure already" }
end
