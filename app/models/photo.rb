class Photo < ApplicationRecord

  has_attached_file :image, :styles => { :medium => "1080x1080>", :thumb => "300x300>" }, :default_url => "http://www.autobuoy.com/images/original/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments,
        -> { extending WithUserAssociationExtension }, dependent: :destroy

  has_many :likes

  belongs_to :user

  validates :title, length: { minimum: 3 }

end
