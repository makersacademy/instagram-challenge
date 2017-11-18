# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
  validates :image, file_size: { less_than: 1.megabytes }
end
