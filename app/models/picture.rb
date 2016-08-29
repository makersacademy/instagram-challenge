class Picture < ActiveRecord::Base
  include WithUserAssociationExtension

  has_attached_file :image, :styles => { small: "60x60", med: "100x100", large: "200x200" }, :default_url => "/assets/images/:style/No-image-available.jpg"

  validates_attachment :image, presence: true,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  belongs_to :user
end
