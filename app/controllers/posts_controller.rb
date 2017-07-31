class PostsController < ApplicationController
  
  before_action :authenticate_user!

  def index 
    @posts = Post.all
  end 

  def new
    @post = current_user.posts.build
  end 

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to posts_path
    else 
      flash[:alert] = "Your post could not be created"
      render :new
    end 
  end 

  def edit
    @post = Post.find(params[:id])
  end 

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to(post_path(@post))
    else 
      flash[:alert] = "Update failed."
      render :edit
    end 
  end 

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post deleted."
      redirect_to posts_path
    else 
      flash[:alert] = "Deletion failed."
      render :index
    end 
  end 

  def show
    @post = Post.find(params[:id])
  end 

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end 

end
