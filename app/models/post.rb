class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :caption, length: {minimum: 3}
end
