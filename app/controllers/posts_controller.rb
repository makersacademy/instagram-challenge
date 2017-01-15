class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post saved. Thank you."
      redirect_to @post
    else
      flash[:alert] = "Post not saved. You must have and image and a caption."
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
    if @post.save
      flash[:notice] = 'Thanks. Your changes have been saved.'
      redirect_to '/'
    else
      flash[:alert] = "Your changes could not be made."
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Your post has been deleted'
    redirect_to '/'
  end


  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
