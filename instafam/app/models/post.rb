class Post < ApplicationRecord

  has_one_attached :image

  belongs_to :user, optional: true

  has_many :comments
end
