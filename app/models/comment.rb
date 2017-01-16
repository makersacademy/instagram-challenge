class Comment < ApplicationRecord

  belongs_to :user

  belongs_to :photo

  validates :user, presence: true
  
end
