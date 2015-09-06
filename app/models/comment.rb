class Comment < ActiveRecord::Base

  belongs_to :photo
  validates :message, presence: true
end
