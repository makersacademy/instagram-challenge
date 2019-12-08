class Post < ApplicationRecord
  belongs_to :user, foreign_key: :user_id

  has_attached_file :image, styles: { medium: "100x100>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
