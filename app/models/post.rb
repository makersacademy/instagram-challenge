class Post < ApplicationRecord
  # Validate moment content_type for medium and thumb sizes and file types
  validates :user_id, presence: true
  has_attached_file :moment, styles: { medium: "600x600>", thumb: "80x80>" }, default_url: "/images/medium/moment-default.jpg"
  validates_attachment_content_type :moment, content_type: ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  acts_as_votable
end
