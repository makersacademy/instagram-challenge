class Post < ActiveRecord::Base
 validates :comment, length: {minimum: 2}
  has_many :comments, dependent: :destroy
end
