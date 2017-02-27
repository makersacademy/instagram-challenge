class Photo < ApplicationRecord

  belongs_to :user
  has_many :comments,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy

end
