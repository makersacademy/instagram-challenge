class Post < ApplicationRecord
  belongs_to :user

  validates :pic, presence: true
  validates :user_id, presence: true
  
  has_attached_file :pic, styles: { medium: "700x>" }
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
end
