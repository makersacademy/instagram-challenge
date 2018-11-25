# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  mount_uploader :photo, PhotoUploader
end
