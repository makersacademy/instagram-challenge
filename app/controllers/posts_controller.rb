class PostsController < ApplicationController
  def new
  end

  def show
    @post = Post.find(params[:id])
    @owner = owner?
    @comments = @post.comments
    @user_liked = logged_in? ? @post.likes.exists?(user_id: current_user.id) : nil
    @like = logged_in? ? @post.likes.find_by(user_id: current_user.id) : nil
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
  
  def create
    current_user.posts.create(post_params)
    redirect_to root_path
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:image, :filter)
  end

  def owner?
    @post.user == current_user
  end
end
