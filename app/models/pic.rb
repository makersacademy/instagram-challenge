class Pic < ApplicationRecord

  has_attached_file :picture, styles: { medium: "200x200>" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  belongs_to :user
end
