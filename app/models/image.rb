class Image < ApplicationRecord

  belongs_to :user
  has_many :comments, -> { extending WithUserAssociationExtension }, dependent: :destroy
  has_many :likes, -> { extending WithUserAssociationExtension }, dependent: :destroy

  validates :title, length: { minimum: 3 }
  validates :description, presence: true
  has_attached_file :image_file, :styles => { :large => "900x900", :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
  validates_attachment :image_file, presence: true,
                       content_type: { :content_type => ["image/jpeg", "image/jpg", "image/png"]}

end
