# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :image, presence: true

  has_attached_file :image
  # has_attached_file :image, styles: { medium: "720x" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
