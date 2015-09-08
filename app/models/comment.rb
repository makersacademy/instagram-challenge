class Comment < ActiveRecord::Base
  include AsUserAssociationExtension

  belongs_to :photo
  belongs_to :user
  validates_presence_of :user
end
