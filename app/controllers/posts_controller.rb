class PostsController < ApplicationController
   before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build_with_user(post_params, current_user)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.posts.delete_with_user(@post, current_user[:id])
      flash[:notice] = 'Post deleted successfully'
      redirect_to '/posts'
      else
        flash[:notice] = 'Only post owner can delete post'
        redirect_to '/posts'
      end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
