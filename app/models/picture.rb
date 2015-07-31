class Picture < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many   :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
  has_many :likes,
      -> { extending WithUserAssociationExtension }, dependent: :destroy

  def destroy_as(user)
   return false unless self.user == user
   destroy
   true
  end
end
