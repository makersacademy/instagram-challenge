class Picture < ActiveRecord::Base
  extend WithUserAssociationExtension

  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, :presence => true

  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  belongs_to :user

  has_many   :likes,
             -> { extending WithUserAssociationExtension },
             dependent: :destroy
end
