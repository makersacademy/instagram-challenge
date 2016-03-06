class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments,
           -> { extending WithUserAssociationExtension },
           dependent: :destroy
end
