class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def new
    @post = Post.new
  end

  def create
    # user = User.find(current_user.id)
    # user.posts.create(post_params)
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    Post.find(params[:id]).delete
  end

  private

  def post_params
    params.require(:post).permit(:title)
  end
end
