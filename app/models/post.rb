# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_one :resource, dependent: :delete

  def info_for_display
    { username: User.find(self.user_id).username,
      resource_loc: Resource.find(self.resource_id).location,
      comments: Comment.where({post_id: self.id}),
      likes: Like.where({post_id: self.id})
    }
  end

end
