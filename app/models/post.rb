class Post < ActiveRecord::Base

  extend WithUserAssociationExtension

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments, -> { extending WithUserAssociationExtension }, dependent: :destroy

end
