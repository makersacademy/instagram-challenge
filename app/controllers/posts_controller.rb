class PostsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = json_response(Post.all)
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)

    json_response(@post, :created)
    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    @post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:caption, :created_at, :image)
  end
end
