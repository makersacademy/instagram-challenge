class Picture < ApplicationRecord

  validates :image, presence: true
  validates :description, length: { minimum: 2 }

  has_attached_file :image, :styles => { :medium => "640x"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  
  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  has_many :likes,
      -> { extending WithUserAssociationExtension },
       dependent: :destroy


  def find_username(id)
    return User.find(id).username
  end

end
