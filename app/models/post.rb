class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :restrict_with_exception
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :user, presence: true
end
