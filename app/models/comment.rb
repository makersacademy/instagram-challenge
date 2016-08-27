class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photograph
  validates :comment, length: { minimum: 3 }
end
