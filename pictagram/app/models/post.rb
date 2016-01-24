class Post < ActiveRecord::Base
 validates :comment, length: {minimum: 2}
  has_many :comments, dependent: :destroy

  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
end
