class Post < ApplicationRecord
  validates_presence_of :title
  mount_uploader :image, ImageUploader

  validates :title, presence: true,
                    length: { minimum: 5 }
end
