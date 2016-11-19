class Post < ActiveRecord::Base

  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
  has_many :likes

  validates :caption, length: { minimum: 3 }, uniqueness: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
