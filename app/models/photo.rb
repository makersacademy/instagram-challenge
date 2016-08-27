class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :feed
  has_many :likes, dependent: :destroy
  has_many :comments,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy
end
