# frozen_string_literal: true

class Post < ApplicationRecord
  validates :caption, presence: true

  has_one_attached :image
  validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..2.megabytes }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def cached_comments_count
    Rails.cache.fetch([self, "comments_count"]) { comments.size }
  end

  def cached_comments
    Rails.cache.fetch([self, "comments"]) { comments.to_a }
  end
end
