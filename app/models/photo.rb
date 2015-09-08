class Photo < ActiveRecord::Base
  include AsUserAssociationExtension

  belongs_to :user
  has_many :comments, -> { extending WithUserAssociationExtension }, dependent: :destroy
  has_many :likes, -> { extending WithUserAssociationExtension }, dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>", large: "800x600>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :user

  def find_username
    User.find(self.user_id).username
  end
end
