class Post < ApplicationRecord
  belongs_to :user
  
  delegate :email, :to => :user
  validates :message, presence: true,
            length: { minimum: 1 }
end
