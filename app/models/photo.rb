class Photo < ApplicationRecord
  has_many :comments,
        -> { extending WithUserAssociationExtension }, dependent: :destroy
  belongs_to :user
  validates :title, length: { minimum: 3 }
end
