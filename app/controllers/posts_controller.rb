class PostsController < ApplicationController
  include PostsHelper

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to "/posts"
      flash[:notice] = "Post successfully added."
    else
      render "new"
    end
  end

  def show
   @post = Post.find(params[:id])
   @comments = @post.comments.order("created_at DESC")
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if (current_user.id == @post.user_id)
      @post.update(post_params)
      flash[:notice] = "Post successfully updated."
    else
      flash[:alert] = "You cannot update this post."
    end
    redirect_to "/posts/#{params[:id]}"
  end

  def destroy
    @post = Post.find(params[:id])
    if (current_user.id == @post.user_id)
      @post.comments.each { |comment| comment.destroy }
      @post.destroy
      flash[:notice] = "Post successfully deleted."
      redirect_to "/posts"
    else
      flash[:alert] = "You cannot delete this post."
      redirect_to "/posts/#{params[:id]}"
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :location, :image)
  end

end
