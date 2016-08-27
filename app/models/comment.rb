class Comment < ActiveRecord::Base
  validates :text, length: {maximum: 50}

  belongs_to :user
  belongs_to :image
end
