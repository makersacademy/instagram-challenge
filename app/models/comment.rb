class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
end

# validates :user, uniqueness: { scope: :restaurant, message: "has liked this photo already" }
