class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  # def new
  #   @post = current_user.posts.build
  # end

  def index
    @post = Post.all
  end

  def create
    # post_params = params["post"]
    # @post = Post.create(post_params.merge(users_id: current_user.id))
    # params.permit!
    @post = @user.posts.create(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :created_at, :updated_at, :users_id)
  end

end
