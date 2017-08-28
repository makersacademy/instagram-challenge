class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.reverse
    @post = Post.new
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    current_user.posts << post
    if post.save
      flash[:success] = "Your post has been created."
      redirect_to posts_url
    else
      flash[:alert] = "You need an image to create a post."
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image, :user_id)
  end
end
