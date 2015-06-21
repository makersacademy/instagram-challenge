class Photo < ActiveRecord::Base

  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  has_many :likes,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  validates_presence_of :descr

end
