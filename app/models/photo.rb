class Photo < ActiveRecord::Base
  belongs_to :user
  delegate :user_name, to: :user
  has_many :comments,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy
  # accept_nested_attributes_for :comments
  has_many :likes,
  -> { extending WithUserAssociationExtension },
  dependent: :destroy

  has_attached_file :image,
  :styles => { :large => "900x900",
               :medium => "300x300>",
               :small => "200x200",
               :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
