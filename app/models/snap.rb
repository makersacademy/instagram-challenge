class Snap < ApplicationRecord
  acts_as_votable
  has_attached_file :image, styles: { medium: '300x300>', large: '600x600>', thumb: '100x100>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :comments
end
