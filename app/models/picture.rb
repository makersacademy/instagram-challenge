class Picture < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '600x400>',
    large: '875x615>'
  }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
