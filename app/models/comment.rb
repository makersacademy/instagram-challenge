class Comment < ActiveRecord::Base
  include AsUserAssociationExtension

  belongs_to :post
  belongs_to :user
end
