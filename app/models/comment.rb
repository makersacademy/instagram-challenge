class Comment < ActiveRecord::Base
  include AsUserAssociationExtension

  belongs_to :photo
  belongs_to :user
end
