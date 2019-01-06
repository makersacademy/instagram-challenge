# frozen_string_literal: true

class Post < ApplicationRecord
  validates :caption, presence: true

  has_one_attached :image
  validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..2.megabytes }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
