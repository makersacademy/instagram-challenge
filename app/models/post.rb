class Post < ActiveRecord::Base
  # TODO: test
  has_many :comments, dependent: :destroy
end
