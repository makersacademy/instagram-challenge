class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy #when post is deleted, photo is deleted as well.
end
