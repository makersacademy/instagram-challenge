class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photograph
  validates :comment, length: { minimum: 3 }
  validates :user, uniqueness: { scope: :photograph, message: "You have already commented on this photograph"}
end
