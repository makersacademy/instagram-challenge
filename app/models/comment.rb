class Comment < ApplicationRecord
  validates :body, presence:true

  belongs_to :picture
end
