# frozen_string_literal: true

class Post < ApplicationRecord
  has_attached_file :picture, styles: { medium: '20x20' }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  has_many :comments
  has_many :likes
  belongs_to :user
  delegate :user_name, to: :user
end
