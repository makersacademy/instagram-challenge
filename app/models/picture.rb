class Picture < ActiveRecord::Base
  include WithUserAssociationExtension

  has_attached_file :image, :styles => { small: "100x100", med: "200x200", large: "400x400" }, :default_url => "/assets/images/:style/No-image-available.jpg"

  validates_attachment :image, presence: true,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  belongs_to :user
  has_many :comments, -> { extending WithUserAssociationExtension }, dependent: :destroy
  has_many :likes, -> { extending WithUserAssociationExtension }, dependent: :destroy
end
