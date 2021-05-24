class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(content: post_params, user_id: session[:user_id])
    @post.image.attach(params[:post][:image])
    redirect_to "post/new" unless @post.image.attached?
    redirect_to posts_path
  end

  def index
    redirect_to "/" unless session[:user_id]
    @posts = Post.all.order(created_at: :desc)
    @comments = Comment.all
  end

  def like
    Post.like(params[:id])
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)[:content]
  end
end
