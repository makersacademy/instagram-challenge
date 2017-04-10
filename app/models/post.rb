class Post < ApplicationRecord
  acts_as_votable
  validates :user_id, presence: true

  belongs_to :user
  validates :image, presence: true
  has_many :comments,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy


  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def getLocation

  end

end
