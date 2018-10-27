# frozen_string_literal: true

require 'carrierwave'
require 'carrierwave/orm/activerecord'


class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true
  validates_processing_of :image
  validate :image_size_validation
  has_many :comments, dependent: :destroy

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
