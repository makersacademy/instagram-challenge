class Post < ActiveRecord::Base

  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
  validates :caption, length: { minimum: 3 }, uniqueness: true

end
