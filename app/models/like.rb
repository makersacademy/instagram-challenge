class Like < ActiveRecord::Base
  include AsUserAssociationExtension

  belongs_to :photo
  belongs_to :user
  validates :user, uniqueness: { scope: :photo, message: "hsa liked this photo already" }
end
