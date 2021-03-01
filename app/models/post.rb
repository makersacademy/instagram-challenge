class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  # has_many_attached :images

  validates :title, length: { minimum: 1, maximum: 50 }
  validates :body, length: { maximum: 280 }

  # after_initialize do
  #   self.title ||= 'Empty Title'
  # end

end
