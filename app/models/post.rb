# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
   delegate :username, to: :user, prefix: true #-> @order.username
end
