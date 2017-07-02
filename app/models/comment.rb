class Comment < ApplicationRecord
  include WithUserAssociationExtension
  
  belongs_to :user
  belongs_to :post
end
