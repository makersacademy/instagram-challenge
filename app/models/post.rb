# frozen_string_literal: true

class Post < ApplicationRecord
  validates :image, presence: true
  belongs_to :user
  has_many :comments
  has_one_attached :image
end
