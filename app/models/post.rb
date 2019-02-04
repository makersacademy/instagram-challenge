# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :photo
  validate :image_type
  belongs_to :user
  has_many :comments

  private
  def image_type
    content_type = ['image/png', 'image/jpeg', 'image/jpeg', 'image/gif']
    if photo.attached? && !content_type.include?(photo.content_type)
      errors.add(:image, 'must be a png, jpeg, jpg or gif')
    elsif !photo.attached?
      errors.add(:image, 'must be attached.')
    end
  end
end
