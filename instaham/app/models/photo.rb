class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :user_id, presence: true
  validates :message, length: { minimum: 3 }
end
