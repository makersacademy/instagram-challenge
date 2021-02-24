class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # def new
  #   @post = current_user.posts.build
  # end

  def index
    @post = Post.all
  end

  def create
    post_params = params["post"]
    @post = Post.create(post_params.merge(users_id: current_user.id))

  end
end
