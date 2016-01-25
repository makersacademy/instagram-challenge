class Picture < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "600x600>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :comments, -> { extending WithUserAssociationExtension }, dependent: :destroy
  has_many :likes, -> { extending WithUserAssociationExtension }, dependent: :destroy
  belongs_to :user
  extend WithUserAssociationExtension
end
