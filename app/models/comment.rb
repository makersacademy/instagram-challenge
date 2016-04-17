class Comment < ActiveRecord::Base
  validates :title, length: {maximum: 50}

  belongs_to :user
  belongs_to :image
end
