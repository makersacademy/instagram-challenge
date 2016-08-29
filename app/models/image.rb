class Image < ApplicationRecord

  has_attached_file :image, :styles => { :medium => "600x600>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments,
  -> { extending WithUserAssociationExtension },
  dependent: :destroy

end
