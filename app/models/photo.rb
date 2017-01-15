class Photo < ApplicationRecord

  has_many :comments,
        -> { extending WithUserAssociationExtension }, dependent: :destroy
  has_many :likes
  belongs_to :user
  validates :title, length: { minimum: 3 }
  
end
