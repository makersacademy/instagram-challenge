class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:notice] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      redirect_to post_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:notice] = "Post updated"
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      @post.destroy
      flash[:notice] = "Post deleted successfully"
      redirect_to '/posts'
    else
      flash[:notice] = "Posts can only be deleted by their owner"
      redirect_to '/posts'
    end
  end


  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
