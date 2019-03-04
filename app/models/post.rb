# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_one :resource, dependent: :delete
  has_one_attached :image

  def info_for_display
    { user: User.find(user_id),
      username: User.find(user_id).username,
      comments: Comment.where({ post_id: id }),
      likes: Like.where({ post_id: id }).to_a,
    }
  end

end
