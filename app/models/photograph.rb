class Photograph < ApplicationRecord
  has_many :comments,
      -> {extending WithUserAssociationExtension},
      dependent: :destroy

  belongs_to :user

  has_many :likes

end
