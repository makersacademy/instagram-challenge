class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  validates :caption, length: { minimum: 3 }
end
