class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    if params[:id] != "new"
      @post = Post.find(params[:id])
    end
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.create(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:body, :image)
  end
end
