class Post < ApplicationRecord
  validates :avatar, presence: true

  has_attached_file :avatar, styles: { medium: "20x20" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
