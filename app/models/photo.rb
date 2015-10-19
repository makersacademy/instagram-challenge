class Photo < ActiveRecord::Base
  acts_as_votable
  validates :image, presence: true
  validates :title, presence: true
  has_attached_file :image, styles: { :medium => '640x' }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :comments,
  -> { extending WithUserAssociationExtension },
    dependent: :destroy
end
