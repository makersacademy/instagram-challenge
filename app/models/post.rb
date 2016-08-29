class Post < ApplicationRecord

  has_many :comments,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy

  belongs_to :user

  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }

end
