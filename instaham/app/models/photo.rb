class Photo < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :message, length: { minimum: 3 }
end
