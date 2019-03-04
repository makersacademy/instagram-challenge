# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :likes, dependent: :destroy
end
