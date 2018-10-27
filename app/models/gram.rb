# frozen_string_literal: true

# Simple Gram model
class Gram < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
end
