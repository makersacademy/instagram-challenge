class Image < ActiveRecord::Base

  belongs_to :user
  has_many :comments,
            -> { extending WithUserAssociationExtension },
            dependent: :destroy

  validates :description, presence: true, allow_blank: false
  has_attached_file :picture,
                    :styles => { :large => "800x600", :medium => "300x300>", :thumb => "100x100>"}
  validates_attachment_presence :picture, message: "needs to be uploaded"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/
end
