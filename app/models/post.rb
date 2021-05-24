class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, :dependent => :destroy

  def self.like(the_id)
    post = Post.find_by(id: the_id)
    post.update(likes: (post.likes + 1))
  end
end
