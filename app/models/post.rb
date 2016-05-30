class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user, presence: true
  validates :image, presence: true
  has_attached_file :image, styles: { medium: "640x>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}
end
