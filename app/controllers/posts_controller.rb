class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Your post has been created."
      redirect_to posts_path
    else
      flash[:alert] = "Picture needed"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render 'edit'
    else
      flash[:alert] = 'Error: Cannot edit someone elses post'
      redirect_to '/posts'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post updated"
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      flash[:notice] = "Post deleted"
      redirect_to posts_path
    else
      flash[:alert] = 'Error: Cannot delete someone elses post'
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
