class Post < ApplicationRecord

  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }

  has_many :comments,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy

  belongs_to :user
  has_many :likes,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy

  has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
