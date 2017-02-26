class Picture < ApplicationRecord

  validates :image, presence: true

  has_attached_file :image, :styles => { :medium => "640x"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  belongs_to :user

  def find_username(id)
    return User.find(id).username
  end

end
