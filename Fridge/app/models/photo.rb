class Photo < ApplicationRecord

  belongs_to :user

  validates :description, presence: true

  has_attached_file :image, styles: { medium: "239x239>" }, default_url: "/images/default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
