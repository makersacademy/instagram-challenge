class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @post = Post.all
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = 'Your post has been uploaded'
      redirect_to posts_path
    else
      flash[:alert] = 'Where yo image at'
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'Post updated'
      redirect_to post_path(@post)
    else
      flash[:error] = 'Please use an image file'
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
