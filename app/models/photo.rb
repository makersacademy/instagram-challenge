class Photo < ActiveRecord::Base

  belongs_to :user

  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  has_many :likes,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  validates_presence_of :descr

end
