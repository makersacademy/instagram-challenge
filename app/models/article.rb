class Article < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { medium: "500x500>"}, default_url: "/images/:style/missing.png"

  validates :user_id, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
