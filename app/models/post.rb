class Post < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 1, maximum: 50 }
  validates :body, length: { maximum: 280 }

  # after_initialize do
  #   self.title ||= 'Empty Title'
  # end

end
