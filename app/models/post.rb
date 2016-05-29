class Post < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  validates :image, presence: true
  has_attached_file :image, styles: { medium: "640x>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
