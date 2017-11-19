# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
  validates :image, file_size: { less_than: 100.megabytes }
end
