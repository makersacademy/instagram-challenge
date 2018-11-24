# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
