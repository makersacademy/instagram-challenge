class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments,
        -> {extending WithUserAssociationExtension},
        dependent: :destroy
  validates :caption, length: {minimum: 1}
end
