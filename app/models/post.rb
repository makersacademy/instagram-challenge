# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_one :resource, dependent: :delete
  has_one_attached :image

  def info_for_display
    { user: User.find(self.user_id),
      username: User.find(self.user_id).username,
      comments: Comment.where({post_id: self.id}),
      likes: Like.where({post_id: self.id}).to_a,
    }
  end

end
