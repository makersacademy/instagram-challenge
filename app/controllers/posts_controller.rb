class PostsController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: post_params["title"],
    desc: post_params["description"],
    user_id: current_user.id)
    p current_user.id
      if @post.save
        redirect_to posts_path
      else
        flash[:notice] = 'Error :Post not created'
        redirect_to posts_path
      end
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(:post_id=>params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :desc, :user_id)
  end

  def comments_for_post(id)
    @comments = Comment.where(:post_id=>id)
  end
end
