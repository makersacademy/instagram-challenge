class Post < ActiveRecord::Base
  include WithUserAssociationExtension

  belongs_to :user
  has_many :likes, -> { extending WithUserAssociationExtension },
            dependent: :destroy

  has_attached_file :image, :styles => { :medium => "293x293#",
                                        :thumb => "100x100>" },
                                        :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :image, :presence => true

end
