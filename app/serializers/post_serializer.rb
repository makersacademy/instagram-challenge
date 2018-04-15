class PostSerializer < ActiveModel::Serializer
  attributes :id, :attachment, :content
  has_one :user
end
