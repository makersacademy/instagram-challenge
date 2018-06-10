class Post < ApplicationRecord
  acts_as_votable
  validates :image, presence: true
  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :user
end
