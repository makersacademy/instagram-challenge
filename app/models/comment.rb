class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  validates :content, presence: true, length: { maximum: 2200 }
end
